require 'yaml/store'

# Reference: Score files...
# @@physical_health  /Users/dain/Dropbox/notes-main/proj/a_set/3-fun/ai-bot/health/phys.txt
# @@mental_health    "/Users/dain/Dropbox/notes-main/proj/a_set/3-fun/ai-bot/health/men.txt
# @@spiritual_health "/Users/dain/Dropbox/notes-main/proj/a_set/3-fun/ai-bot/health/spir.txt
# @@emotional_health "/Users/dain/Dropbox/notes-main/proj/a_set/3-fun/ai-bot/health/emo.txt
# @@intelligence     "/Users/dain/Dropbox/notes-main/proj/a_set/3-fun/ai-bot/health/intel.txt

class Logger
  attr_reader :database

  def initialize
    @database = Database.new
***REMOVED***

  def increase_score file, addition
    # TODO: next refactor idea...
    # current = FileStore.read("health/#{file}.txt").to_f
    # Database::FileStore.write("health/#{file}.txt", current+addition)
    # Database::YamlStoree.new.save(file, addition)
    current = File.read("health/#{file}.txt").to_f
***REMOVED***
    p "You went from a '#{file} health' score of: #{current}"
    p "To the increased score..#{current+addition}"
    File.write("health/#{file}.txt", current+addition)
    @database.save(file, addition)
***REMOVED***
***REMOVED***

class DatabaseCreator
  def initialize
    create_db_file
    create_empty_log_object
***REMOVED***

  def create_db
    create_db_file
    create_empty_log_object
***REMOVED***

  def create_db_file
    File.new('my_database.yaml', 'w')
***REMOVED***

  def create_empty_log_object
    connection.transaction do
      connection[LOG_STORE] = {}
      connection.commit ; connection.abort
  ***REMOVED***
***REMOVED***
***REMOVED***

class Database

  LOG_KEY = "log"

  def initialize
    DatabaseCreator.new.build! unless db_exists?
***REMOVED***

  def client
    connection
***REMOVED***

  def find
    db_contents
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
        client[LOG_KEY][today] = {}
        row = client[LOG_KEY][today][now] = {}
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
    @_connection ||= YAML::Store.new('my_database.yaml')
***REMOVED***

  def db_contents
    @_db_contents ||= YAML.load(File.read('my_database.yaml'))[LOG_KEY]
***REMOVED***

***REMOVED***

  def db_exists?
    File.exist?('my_database.yaml')
***REMOVED***

***REMOVED***
