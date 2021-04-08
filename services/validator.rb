class Validator

  def initialize(launcher:)
    @commands = launcher.commands
    @logger   = launcher.logger
    @actions  = @commands.actions
    @database = @logger.database
  end

  def valid?
    validate
  end

  private

  def validate
    db_file_exists? and all_methods_published?
  end

  def db_file_exists?
    raise "Database file not found" if db_not_found?
    success
  end

  def all_methods_published?
    @actions.each do |action|
      no_action_error(action) if not_implemented?(action)
    end and success
  end

  def not_implemented? action
    not [implemented - globals].flatten!.include? action
  end

  def implemented
    @commands.methods
  end

  def globals
    Object.methods
  end

  def no_action_error action
    throw_error(NoMethodError, 
      "Commands.#{action}", 
      'You forgot to add the method for that habit you added to the CMD_ACTION_MAPPER.'
    )
  end

  def throw_error error_type, location, user_text
    raise error_type, location, user_text
  end

  def db_not_found?
    not @database.exists?
  end

  protected

  def success
    true
  end

end

