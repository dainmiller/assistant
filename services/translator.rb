#
#        😎🔥🌲🎙📚🔫👾
#
# Beware... here be metaprogramming
#
require_relative '../config/commands'

class Array
  def then &block
    block.call
  end
end

class Translator

  def initialize
    setup_app_api config: commands_config_file
  end

  def setup_app_api(config:)
    build_methods_from config
  end

  def skipper
    new
  end

  private

  def build_methods_from file
    file.each do |obj|
      build_method_for obj
    end.then { show_ui }
  end

  def build_method_for obj
    define_singleton_method(meth_name_from(obj)) do
      internals obj: obj
    end
  end

  def meth_name_from obj
    obj.keys.flatten.first
  end

  # TODO: Remove the mystery guest strings here
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
      Logger.new.increase_score "config/health/#{file(attrs)}", Commands::ADDITIVE
    }
  end

  def show_ui
    @method_map = {}
    present_selections
  end

  def present_selections
    @method_mapper = {}
    p "======================================"
    p "Pick what you want to do next."
    p dynamic_dialogue
    user_selection = gets.strip
    call_method find_method @method_mapper, user_selection
  end

  def dynamic_dialogue
    method_mapper
  end

  def method_mapper
    ["walk", "water"].each_with_index do |t, i|
      @method_mapper[t] = i
    end
    return @method_mapper
  end

  def find_method obj, user_selection
    return obj.find { |e|
      e[1].to_i == "#{user_selection}".to_i
    }.first
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

  def success
    true
  end
end
