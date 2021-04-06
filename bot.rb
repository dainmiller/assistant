require_relative 'services/launcher'
require_relative 'services/logger'
require_relative 'db/database'
require_relative 'config/commands'

class Bot
  attr_reader :logger, :commands

  def self.run ; new ; end

  def initialize
    @logger   = Logger.new
    @commands = Commands.new logger: @logger
  end

  def start_cli
    p "Good morning, Dain"
    p "Welcome to another day in your life"
    p "Let's jump right into the day..."

    @launcher = Launcher.new(
      commands: @commands,
      logger: @logger
    )

    @launcher.launch
  end

end
