require 'date'
require 'yaml/store'
require_relative 'config'
require_relative 'database'
require_relative 'runner'

class AssistantBot

  def self.run ; new ; ***REMOVED***

  def initialize
    p "Good morning, Dain"
    p "Welcome to another day in your life"
    p "Let's jump right into the day..."

    @logger       = Logger.new
    @runner       = Commands::Runner.new logger: @logger
    @configurator = Config::App.new(
      runner: @runner,
      logger: @logger
    )

    @configurator.start
***REMOVED***

***REMOVED***

AssistantBot.run
