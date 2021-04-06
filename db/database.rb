require 'yaml/store'
require 'date'

class Decorator ; end
class Utility ; end


class Database

  LOG_KEY   = 'log'
  LOG_FILE  = '/Users/dain/Dropbox/notes-main/proj/a_set/1-product/ai-bot/db/data/my_database.yaml'

  def initialize
    @connection ||= YAML::Store.new(LOG_FILE)
    DbInit.new(@connection).build! unless db_exists?
  end

  def all
    contents
  end

  def save key, value
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
    begin @connection[LOG_KEY][today]
    rescue
      @connection[LOG_KEY][today] = {}
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

end
