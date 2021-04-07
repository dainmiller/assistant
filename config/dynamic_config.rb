# Checkpoint - fully working dynamic system
# TODO: Refactor the F out of this!
class DynamicConfig

  def initialize
    @cmds       = []
    @method_map = {}
    build
    present_selections
  end

  def build!
    build_methods_from commands_config_file
  end

  def present_selections
    p "======================================"
    p "Pick what you want to do next."
    p dynamic_dialogue
    user_selects = gets.strip
    self.send(find_method(obj))
  end


  def commands_config_file
    YAML.load(File.read('config/data/commands.yaml'))
  end

  def build_methods_from file
    file.each do |obj|
      build_method obj
    end
  end

  def build_method obj
    meth_name = obj.keys.flatten.first
    @cmds << meth_name
    define_singleton_method(meth_name) do
      method_definition obj: obj
    end
  end

  def method_definition(obj:)
    p prompt(obj)
    bool = gets.strip
    return present_selections if bool == 'skip'
    if bool == 'yes'
      log obj
      success
    else
      self.send(meth_name)
    end
  end

  def log obj
    obj.values.map { |attrs|
      Logger.new.increase_score file(attrs), Commands::ADDITIVE
    }
  end

  def file attrs
    attrs[1].values.first
  end

  def prompt obj
    obj.values.map { |e|
      return e[4].values
    }
  end

  def dynamic_dialogue
    return method_mapper
  end

  def method_mapper
    @cmds.each_with_index do |cmd, i|
      @method_mapper[i] = cmd
    end
  end

  def find_method obj
    return obj.find { |e|
      e[0].to_i == "#{user_selects}".to_i
    }[1]
  end

  def success
    true
  end
end
