require 'date'
require 'yaml/store'
require_relative 'config'
require_relative 'database'
require_relative 'runner'

class Bot
  attr_reader :logger, :runner

  def self.run ; new ; ***REMOVED***

  def initialize
    @logger = Logger.new
    @runner = Commands::Runner.new logger: @logger
***REMOVED***

  def start_cli
    p "Good morning, Dain"
    p "Welcome to another day in your life"
    p "Let's jump right into the day..."

    @configurator = Config::App.new(
      runner: @runner,
      logger: @logger
    )

    @configurator.start
***REMOVED***

***REMOVED***
