class Configurator

  def initialize(commands:, logger:)
    @commands = commands
    @logger   = logger
    @actions  = @commands.actions
    @database = @logger.database
***REMOVED***

  def start
    @commands.what if ready?
***REMOVED***

  def ready?
    validate
***REMOVED***

  def validate
    db_file_exists and all_methods_published?
***REMOVED***

***REMOVED***

  def all_methods_published?
    @actions.each do |action|
      no_action_error(action) if not_implemented?(action)
  ***REMOVED***
***REMOVED***

  def db_file_exists?
    raise "Database file not found" if db_not_found?
***REMOVED***

  def no_action_error action
    throw_error(NoMethodError, 
      "Commands.#{action}", 
      'You forgot to add the method'
    )
***REMOVED***

  def throw_error error_type, location, user_text
    raise error_type, location, user_text
***REMOVED***

  def db_not_found?
    not @database.exists?
***REMOVED***

  def not_implemented? action
    not [@commands.methods - Object.methods].flatten!.include? action
***REMOVED***

***REMOVED***

