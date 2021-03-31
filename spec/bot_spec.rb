require           'yaml'
require_relative  '../bot.rb'
require_relative  '../commands.rb'

describe Bot do

  describe "#.run" do
    it "starts a logger" do
      bot = Bot.new
      expect(bot.logger).to be_instance_of Logger
  ***REMOVED***
    it "starts a command runner" do
      bot = Bot.run
      expect(bot.commands).to be_instance_of Commands
  ***REMOVED***
***REMOVED***

***REMOVED***

describe Logger do

  before(:each) do
    @logger = Logger.new
***REMOVED***

  describe "#.new" do
    it "should start an instance of the database" do
      expect(@logger.database).to be_instance_of Database
  ***REMOVED***
***REMOVED***

  describe "#.increase_score" do
    it "should add an additive int to the base score" do
      # Setup
      additive  = Commands::ADDITIVE
      test_file = '_tmp/phys'
      old_score = File.read("health/#{test_file}.txt").to_f

      # Hotswap db file for test
      # (constant assignment allowed in rspec context)
      Database::LOG_FILE = 'spec/test_database.yml'
      @logger.database = Database.new

      # Call the real world w/stubs
      @logger.increase_score test_file, additive
      new_score = File.read('health/_tmp/phys.txt').to_f

      # Assertion
      expect(new_score).to eq old_score+additive
  ***REMOVED***
***REMOVED***
***REMOVED***

describe Database do

  describe "setup" do
    it "should have a db index LOG_KEY specified" do
      expect(Database::LOG_KEY).to_not be_nil
  ***REMOVED***
    it "should have a db file specifified" do
      expect(Database::LOG_FILE).to_not be_nil
  ***REMOVED***
***REMOVED***

  context "instance" do

    before(:each) do
      @database = Database.new
  ***REMOVED***

    describe "#.client" do
      it "should start a YAML file wrapper (Psych)" do
        expect(@database.client).to be_instance_of Psych::Store
    ***REMOVED***
      it "should return db file contents" do
        expect(@database.all).to eq YAML.load(File.read(Database::LOG_FILE))['log']
    ***REMOVED***
  ***REMOVED***

    describe "#.find" do
      xit 'should return specific value for key' do
    ***REMOVED***
  ***REMOVED***

    describe "#.save" do
      xit 'should allow you to save to db' do
    ***REMOVED***
  ***REMOVED***

    describe "#.all" do
      xit 'should return all the data in the db' do
    ***REMOVED***
  ***REMOVED***

    describe "#.exists?" do
  ***REMOVED***
***REMOVED***
***REMOVED***

def setup_scoring logger
***REMOVED***
