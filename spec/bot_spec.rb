require           'yaml'
require_relative  '../bot.rb'
require_relative  '../config/commands.rb'

describe CommandTest do

  it 'should define methods' do
    c = CommandTest.new
    c.brush_teeth
  end

end

describe Bot do

  describe "#.run" do
    it "starts a logger" do
      bot = Bot.new
      expect(bot.logger).to be_instance_of Logger
    end
    it "starts a command runner" do
      bot = Bot.run
      expect(bot.commands).to be_instance_of Commands
    end
  end

end

describe Logger do

  before(:each) do
    @logger = Logger.new
  end

  describe "#.new" do
    it "should start an instance of the database" do
      expect(@logger.database).to be_instance_of Database
    end
  end

  describe "#.increase_score" do
    xit "should add an additive int to the base score" do
      # Setup
      additive  = Commands::ADDITIVE
      file      = '_tmp/phys'
      old_score = File.read("config/health/#{file}.txt").to_f

      # Hotswap db file for test db
      # (constant assignment allowed in rspec only)
      Database::LOG_FILE = 'spec/support/test_database.yml'
      @logger.database = Database.new

      # Call the real world w/stubs
      @logger.increase_score file, additive
      new_score = File.read("config/health/#{file}.txt").to_f

      # Assertion
      expect(new_score).to eq old_score+additive
    end
  end
end

describe Database do

  describe "setup" do
    it "should have a db index LOG_KEY specified" do
      expect(Database::LOG_KEY).to_not be_nil
    end
    it "should have a db file specifified" do
      expect(Database::LOG_FILE).to_not be_nil
    end
  end

  context "instance" do

    before(:each) do
      @database = Database.new
    end

    describe "#.client" do
      xit "should start a YAML file wrapper (Psych)" do
        expect(@database.all).to be_instance_of Psych::Store
      end
      it "should return db file contents" do
        expect(@database.all).to eq YAML.load(File.read(Database::LOG_FILE))['log']
      end
    end

    describe "#.find" do
      it 'should return specific value for key' do
      end
    end

    describe "#.save" do
      it 'should allow you to save to db' do
      end
    end

    describe "#.all" do
      it 'should return all the data in the db' do
      end
    end

    describe "#.exists?" do
    end
  end
end
