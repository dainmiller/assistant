require           'yaml'
require_relative  '../bot.rb'
require_relative  '../commands.rb'

describe Bot do
  describe "#.run" do
    it "starts a logger" do
      bot = Bot.run
      expect(bot.logger).to be_instance_of Logger
  ***REMOVED***

    it "starts a command runner" do
      bot = Bot.run
      expect(bot.commands).to be_instance_of Commands
  ***REMOVED***
***REMOVED***
***REMOVED***

describe Logger do
  describe "#.new" do
    it "should start an instance of the database" do
      logger = Logger.new
      expect(logger.database).to be_instance_of Database
  ***REMOVED***
***REMOVED***
***REMOVED***

describe Database do
  before(:each) do
    @database = Database.new
***REMOVED***

  it "should have a db index LOG_KEY specified" do
    expect(Database::LOG_KEY).to_not be_nil
***REMOVED***

  it "should have a db file specifified" do
    expect(Database::LOG_FILE).to_not be_nil
***REMOVED***

  describe "#.client" do

    it "should start a YAML file wrapper (Psych)" do
      expect(@database.client).to be_instance_of Psych::Store
  ***REMOVED***

    it "should return db file contents" do
      expect(@database.all).to eq YAML.load(File.read(Database::LOG_FILE))['log']
  ***REMOVED***
***REMOVED***
***REMOVED***