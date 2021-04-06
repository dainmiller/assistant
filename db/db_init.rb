class DbInit
  STORE_TYPE = {}

  def initialize connection
    @connection = connection
  end

  def build!
    create_db_file
    create_empty_log_object
  end

  def create_db_file
    File.new(Database::LOG_FILE, 'w')
  end

  def create_empty_log_object
    @connection.transaction do
      connection[LOG_STORE] = {}
      connection.commit ; connection.abort
    end
  end
end
