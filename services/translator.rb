# Beware... here be metaprogramming
#
# TODO: Refactor the F out of this!
# TODO: Move this to services/
# NOTE: Everytime you touch the file, make it better  
class Translator

  def initialize
    translate_config_to_methods
    show_ui
  end

  def translate_config_to_methods
    @cmds = []
    build
  end

  def build
    build_methods_from commands_config_file
  end

  def build_methods_from file
    file.each do |obj|
      build_method_for obj
    end
  end

  def build_method_for obj
    define_singleton_method(meth_name_from(obj)) do
      internals obj: obj
    end
  end

  def meth_name_from obj
    obj.keys.flatten.first
  end

  def internals(obj:)
    p prompt(obj)
    bool = gets.strip
    return present_selections if bool == 'skip'
    if bool == 'yes'
      log obj
      success
    else
      call_method meth_name_from(obj)
    end
  end

  def prompt obj
    obj.values.map { |e|
      return e[4].values
    }
  end

  def log obj
    obj.values.map { |attrs|
      Logger.new.increase_score file(attrs), Commands::ADDITIVE
    }
  end

  def show_ui
    @method_map = {}
    present_selections
  end

  def present_selections
    p "======================================"
    p "Pick what you want to do next."
    p dynamic_dialogue
    user_selection = gets.strip
    call_method find_method obj, user_selection
  end

  def dynamic_dialogue
    method_mapper
  end

  def method_mapper
    @cmds.each_with_index do |cmd, i|
      @method_mapper[i] = cmd
    end
  end

  def find_method obj, user_selection
    return obj.find { |e|
      e[0].to_i == "#{user_selection}".to_i
    }[1]
  end

  def call_method meth
    self.send meth
  end

  def commands_config_file
    YAML.load(File.read('config/data/commands.yaml'))
  end

  def file attrs
    attrs[1].values.first
  end

  protected

  def success
    true
  end
end
