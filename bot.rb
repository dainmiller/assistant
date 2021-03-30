require 'date'
require 'yaml/store'
require_relative 'config'
require_relative 'database'
require_relative 'commands'

class Bot
  attr_reader :logger, :commands

  def self.run ; new ; ***REMOVED***

  def initialize
    @logger   = Logger.new
    @commands = Commands.new logger: @logger
***REMOVED***

  def start_cli
    p "Good morning, Dain"
    p "Welcome to another day in your life"
    p "Let's jump right into the day..."

    @configurator = Configurator.new(
      commands: @commands,
      logger: @logger
    )

    @configurator.start
***REMOVED***

***REMOVED***
