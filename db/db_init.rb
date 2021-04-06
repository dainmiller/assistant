class DbInit
  STORE_TYPE = {}

  def initialize connection
    @connection = connection
***REMOVED***

  def build!
    create_db_file
    create_empty_log_object
***REMOVED***

  def create_db_file
    File.new(Database::LOG_FILE, 'w')
***REMOVED***

  def create_empty_log_object
    @connection.transaction do
      connection[LOG_STORE] = {}
      connection.commit ; connection.abort
  ***REMOVED***
***REMOVED***
***REMOVED***
