require_relative 'validator'

class Launcher
  attr_reader :commands, :logger

  def initialize(commands:, logger:)
    @logger   = logger
    @commands = commands
    @database = logger.database
***REMOVED***

  def launch
    @commands.open if Validator.new(launcher: self).valid?
***REMOVED***

***REMOVED***

