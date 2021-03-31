require 'yaml/store'
require_relative 'insertion'

class Decorator ; ***REMOVED***
class Utility ; ***REMOVED***

class Logger < Decorator
  attr_accessor :database

  def initialize
    @database = Database.new
***REMOVED***

  def increase_score file, addition
    current = File.read("health/#{file}.txt").to_f
***REMOVED***
    p "You went from a '#{file} health' score of: #{current}"
    p "To the increased score..#{current+addition}"
    File.write("health/#{file}.txt", current+addition)
    @database.save(file, addition)
***REMOVED***
***REMOVED***

class DatabaseCreator
  STORE_TYPE = {}

  def initialize ; ***REMOVED***

  def build!
    create_db_file
    create_empty_log_object
***REMOVED***

  def create_db_file
    File.new(Database::LOG_FILE, 'w')
***REMOVED***

  def create_empty_log_object
    connection.transaction do
      connection[LOG_STORE] = {}
      connection.commit ; connection.abort
  ***REMOVED***
***REMOVED***
***REMOVED***

class Database

  LOG_KEY   = "log"
  LOG_FILE  = 'my_database.yaml'

  def initialize
    DatabaseCreator.new.build! unless db_exists?
***REMOVED***

  def client
    connection
***REMOVED***

  def all
    db_contents
***REMOVED***

  def find key
    # TODO: return value for key
***REMOVED***

  def save key, value
    insert do |row|
      row[key] = value
  ***REMOVED***
***REMOVED***


  def exists?
    db_exists? and db_contents.any?
***REMOVED***

***REMOVED***

  def insert
    client.transaction do
      begin
        row = client[LOG_KEY][today][now] = {}
      rescue
        if client.key? LOG_KEY
          client[LOG_KEY][today] = {}
          row = client[LOG_KEY][today][now] = {}
    ***REMOVED***
          client[LOG_KEY] = {}
      ***REMOVED***
    ***REMOVED***
      yield row
  ***REMOVED***
***REMOVED***

  def today
    Date.today
***REMOVED***

  def now
    Time.new.to_s
***REMOVED***

  def connection
    @_connection ||= YAML::Store.new(LOG_FILE)
***REMOVED***

  def db_contents
    @_db_contents ||= YAML.load(File.read(LOG_FILE))[LOG_KEY]
***REMOVED***

***REMOVED***

  def db_exists?
    File.exist?(LOG_FILE)
***REMOVED***

***REMOVED***
