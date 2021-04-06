require 'yaml/store'
require 'date'

class Decorator ; ***REMOVED***
class Utility ; ***REMOVED***


class Database

  LOG_KEY   = 'log'
  LOG_FILE  = '/Users/dain/Dropbox/notes-main/proj/a_set/1-product/ai-bot/db/data/my_database.yaml'

  def initialize
    @connection ||= YAML::Store.new(LOG_FILE)
    DbInit.new(@connection).build! unless db_exists?
***REMOVED***

  def all
    contents
***REMOVED***

  def save key, value
    insert do |row|
      row[key] = value
  ***REMOVED***
***REMOVED***

  def exists?
    db_exists? and contents.any?
***REMOVED***

***REMOVED***

  def insert
    @connection.transaction do
      yield stamp
  ***REMOVED***
***REMOVED***

  def stamp
    get_today()[now] = {}
***REMOVED***

***REMOVED***

  def get_today
    begin @connection[LOG_KEY][today]
    rescue
      @connection[LOG_KEY][today] = {}
  ***REMOVED***
***REMOVED***

  def file
    File.read(LOG_FILE)
***REMOVED***

  def yaml file
    YAML.load file
***REMOVED***

  def today
    Date.today
***REMOVED***

  def now
    Time.new.to_s
***REMOVED***

  def contents
    yaml(file)[LOG_KEY]
***REMOVED***

  def db_exists?
    File.exist?(LOG_FILE)
***REMOVED***

***REMOVED***
