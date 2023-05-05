require 'yaml/store'
require 'date'
require 'pry'

class Decorator ; end
class Utility ; end

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
      connection[Database::LOG_KEY] = {}
      connection.commit ; connection.abort
    end
  end
end

class Database

  LOG_KEY   = 'log'
  LOG_FILE  = 'db/data/my_database.yaml'

  def initialize
    @connection ||= YAML::Store.new(LOG_FILE)
    DbInit.new(@connection).build! unless db_exists?
  end

  def all
    contents
  end

  def save key, value
    key = get_key_from key
    insert do |row|
      row[key] = value
    end
  end

  def exists?
    db_exists? and contents.any?
  end

  private

  def insert
    @connection.transaction do
      yield row
    end
  end

  def row
    get_today()[now] = {}
  end

  protected

  def get_today
    if @connection[LOG_KEY].key? today
      return @connection[LOG_KEY][today]
    else
      @connection[LOG_KEY][today] = {}
      return  @connection[LOG_KEY][today]
    end
  end

  def file
    File.read(LOG_FILE)
  end

  def yaml file
    YAML.load file
  end

  def today
    Date.today
  end

  def now
    Time.new.to_s
  end

  def contents
    yaml(file)[LOG_KEY]
  end

  def db_exists?
    File.exist?(LOG_FILE)
  end

  def get_key_from key
    key.split('/')[2] if key.split('/').count > 1
  end
end
