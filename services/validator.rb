class Validator

  def initialize(launcher:)
    @commands = launcher.commands
    @logger   = launcher.logger
    @actions  = @commands.actions
    @database = @logger.database
***REMOVED***

  def valid?
    validate
***REMOVED***

***REMOVED***

  def validate
    db_file_exists? and all_methods_published?
***REMOVED***

  def db_file_exists?
    raise "Database file not found" if db_not_found?
    success
***REMOVED***

  def all_methods_published?
    @actions.each do |action|
      no_action_error(action) if not_implemented?(action)
  ***REMOVED*** and success
***REMOVED***

  def not_implemented? action
    not [implemented - globals].flatten!.include? action
***REMOVED***

  def implemented
    @commands.methods
***REMOVED***

  def globals
    Object.methods
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

***REMOVED***

  def success
    true
***REMOVED***

***REMOVED***

