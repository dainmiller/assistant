require_relative 'services/launcher'
require_relative 'services/logger'
require_relative 'db/database'
require_relative 'config/commands'
require_relative 'config/globals'

class Bot
  attr_reader :logger, :commands

  def self.run ; new ; end

  def initialize
    @logger   = Logger.new
    @commands = Commands.new logger: @logger
  end

  def start_cli
    p "Welcome back, #{Globals::NAME}"
    p "Welcome to another moment in your life"
    p "How are you #{Globals::MISSION_STATEMENT} today?"

    @launcher = Launcher.new(
      commands: @commands,
      logger: @logger
    )

    @launcher.launch
  end

end
