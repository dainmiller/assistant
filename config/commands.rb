require 'yaml'

class Hash
  def then &block
    block.call
  end
end

# PROTOTYPE CLASS - NOT REFACTORED AT ALL
# Checkpoint - fully working dynamic system
class CommandTest
  @@cmds = []

  def initialize
    file = YAML.load(File.read('config/data/commands.yaml'))
    file.each do |obj|
      build_method obj
    end
    @method_mapper = {}
  end

  def build_method obj
    meth_name = obj.keys.flatten.first
    @@cmds << meth_name
    define_singleton_method(meth_name) do
      method_definition obj: obj
    end
  end

  def method(obj:)
    p prompt(obj)
    bool = gets.strip
    return skipper if bool == 'skip'
    if bool == 'yes'
      log obj
      success
    else
      self.send(meth_name)
    end
  end

  def log obj
    obj.values.map { |e| 
      Logger.new.increase_score e[1].values.first, Commands::ADDITIVE
    }
  end

  def prompt obj
    obj.values.map { |e|
      return e[4].values
    }
  end

  def skipper
    p "======================================"
    p "Pick what you want to do next."
    p dynamic_dialogue
    user_selects = gets.strip
    self.send(find_method(obj))
  end
  
  def dynamic_dialogue
    @@cmds.each_with_index do |cmd, i|
      @method_mapper[i] = cmd
    end
    return @method_mapper
  end
  
  def find_method obj
    method_obj = obj.find { |e| e[0].to_i == "#{user_selects}".to_i }
    return method_obj[1]
  end

  def success
    true
  end
end

class Commands

  ADDITIVE = '0.01'.to_f.freeze

  attr_reader :actions

  @@cmd_to_action_mapper = {
    1  => :walk,
    2  => :water,
    3  => :clean,
    4  => :clean_closet,
    5  => :work,
    6  => :read_spirit,
    7  => :meditate,
    8  => :kung_fu_tai_chi,
    9  => :read_nonfic,
    10 => :journal,
    11 => :brush_teeth,
    12 => :wash_face,
  }

  def initialize(logger:)
    @logger = logger
  end

  # API ux improvements
  def cli   ; skipper ; end
  def open  ; skipper ; end
  def start ; skipper ; end
  def reset ; skipper ; end

  def actions
    @@cmd_to_action_mapper.values
  end

  def scores
    @logger.files.each do |file, score|
      p "Score: #{score} for area of life - #{file}"
    end.then { sleep(2) and reset }
  end

  def skipper
    p "------------------------------------------------------"
    p "Pick what you want to do next (pick by name or number)"
    p "(note -- you can type `score` to get your score anytime)"
    @@cmd_to_action_mapper.each do |cmd, action|
      p "#{cmd}. #{action}"
    end
    execute gets.strip
  end

  def brush_teeth
    p "Did you brush your teeth?"
    bool = gets.strip
    return reset if bool == 'skip'
    if bool == 'yes'
      log 'phys', ADDITIVE
    else
      brush_teeth
    end
  end

  def wash_face
    p "Did you wash your face?"
    bool = gets.strip
    return reset if bool == 'skip'
    if bool == 'yes'
      log 'phys', ADDITIVE
    else
      wash_face
    end
  end

  def water
    p "Did you drink 1 bottle and fill up another (e.g. yes/no)"
    bool = gets.strip
    return reset if bool == 'skip'
    if bool == "yes"
      log 'phys', ADDITIVE
    else
      p "Go get some water before anything else"
      p "This will reduce any headaches brother"
      water
    end
  end

  def walk
    p "Start walking..."
    p "How long did you walk in minutes (e.g. 80)?"
    mins = gets.strip.to_i
    return reset if mins == 0
    if mins > 100
      log 'phys', 0.15
    elsif mins < 100 and mins > 60
      log 'phys', 0.1
    else
      log 'phys', 0.05
    end
    reset
  end

  def clean
    p "Start cleaning..."
    p "Did you clean the entire room?"
    bool = gets.strip
    return reset if bool == 'skip'
    if bool == "yes"
      log 'men', ADDITIVE
    else
      p "You should have cleaned brother"
      p "You can do it"
      clean
    end
  end

  def clean_closet
    p "Even the closet?... (e.g. yes/no)"
    bool = gets.strip
    return reset if bool == 'skip'
    if bool == "yes"
      log 'men', ADDITIVE
    else
      p "Go clean closet..."
      clean_closet
    end
  end

  def work
    p "Start some work"
    p "Do something mentally HARD..."
    p "Did you get some productive work done? (e.g. 'I did x,y,z')"
    bool = gets.strip
    return reset if bool == 'skip'
    unless bool == "no"
      log 'men', ADDITIVE
    else
      p "Get back to work until you can answer yes"
      work
    end
  end

  def read_spirit
    p "Grab a spiritual text"
    p "Did you read 1 page at minimum? (e.g. yes/no)"
    bool = gets.strip
    return reset if bool == 'skip'
    if bool == "yes"
      log 'spir', ADDITIVE
    else
      p "Start reading at least 1 page or 1 article..."
      read_spirit
    end
  end

  def meditate
    p "You know what meditating is..."
    p "Did you meditate for at least 1min? (e.g. yes/no)"
    bool = gets.strip
    return reset if bool == 'skip'
    if bool == "yes"
      log 'emo', ADDITIVE
    else
      p "Start meditating brother... it only takes 1min"
      meditate
    end
  end

  def read_nonfic
    p "Read something goooood"
    p "Did you read at least 1 page or article? (e.g. yes/no)"
    bool = gets.strip
    return reset if bool == 'skip'
    if bool == "yes"
      log 'intel', ADDITIVE
    else
      p "Get back to work until you can answer yes"
      read_nonfic
    end
  end

  def kung_fu_tai_chi
    p "Prepare to practice Kung Fu or Tati Chi"
    p "Did you practice Kung Fu or Tai Chi for at least 1min? (e.g. yes/no)"
    bool = gets.strip
    return reset if bool == 'skip'
    if bool == "yes"
      log 'spir', ADDITIVE
    else
      p "Go practice it only takes 1 minute"
      p "Don't forget to pull up a youtube vid if you need"
      kftc
    end
  end

  def journal
    p "Prepare to start journaling"
    p "Did you journal (digital or analog) for a few pages?"
    bool = gets.strip
    return reset if bool == 'skip'
    if bool == "yes"
      log 'emo', ADDITIVE
    else
      p "Go write something down"
      p "It only takes 30seconds to write something down"
      kftc
    end
  end

  private

  def execute choice
    scores if is_score?(choice)
    if is_number?(choice) and cmd_exists?(choice)
      choice = choice.to_i
      send(@@cmd_to_action_mapper[choice])
    else # else we know its a string
      send(choice)
    end
  end
  
  def is_score? choice
    choice == 'score' or choice == 'scores' or choice == 's'
  end

  def log action, value
    @logger.increase_score action, value
    reset
  end

  def is_number? choice
    choice.to_i != 0
  end

  def cmd_exists? choice
    @@cmd_to_action_mapper.key? choice.to_i
  end

  protected

  def method_missing method_name, *args, &block
    skipper
  end

end
