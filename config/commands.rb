require 'yaml'

class Hash
  def then &block
    block.call
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
    13 => :push_ups,
    14 => :deep_work,
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
    end.then { sleep(2) and reset } # love the `then` ❤️
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

  def deep_work
    p "Start working deeply..."
    p "How many hours did you work deeply?"
    hours = gets.strip.to_i
    if not hours.to_s == 0
      if hours > 1
        log 'config/health/men', 0.15
      elsif hours < 100 and hours > 3
        p "Be careful you aren't working and ignoring the world for too long."
        p "Balance..."
        log 'config/health/men', 0.1
      else
        log 'config/health/men', 0.05
      end
      log 'config/indiv/deep_work', hours
    end
    reset
  end

  # NOTE: ALL of these methods are being converted to `config/data/commands.yaml`
  # all this code will be traded in for the simple class `services/Translator`
  def walk
    p "Start walking..."
    p "How long did you walk in minutes (e.g. 80)?"
    mins = gets.strip.to_i
    return reset if mins == 0
    if not mins.to_s == 0
      if mins > 100
        log 'config/health/phys', 0.15
      elsif mins < 100 and mins > 60
        log 'config/health/phys', 0.1
      else
        log 'config/health/phys', 0.05
      end
      log 'config/indiv/walk', mins
    end
    reset
  end

  def push_ups
    p "Start your pushups..."
    p "How many pushups did you do?"
    push_ups = gets.strip.to_i
    if push_ups > 0
      if push_ups > 100
        log 'config/health/phys', 0.15
      elsif push_ups < 100 and push_ups > 60
        log 'config/health/phys', 0.1
      else
        log 'config/health/phys', 0.05
      end
      log 'config/indiv/push_ups', push_ups
    end
    reset
  end

  def brush_teeth
    p "Did you brush your teeth?"
    bool = gets.strip
    return reset if bool == 'skip'
    if bool == 'yes'
      log 'config/health/phys', ADDITIVE
    else
      brush_teeth
    end
    reset
  end

  def wash_face
    p "Did you wash your face?"
    bool = gets.strip
    return reset if bool == 'skip'
    if bool == 'yes'
      log 'config/health/phys', ADDITIVE
    else
      wash_face
    end
    reset
  end

  def water
    p "Did you drink 1 bottle and fill up another (e.g. yes/no)"
    bool = gets.strip
    return reset if bool == 'skip'
    if bool == "yes"
      log 'config/health/phys', ADDITIVE
    else
      p "Go get some water before anything else"
      p "This will reduce any headaches brother"
      water
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
    reset
  end

  def clean_closet
    p "Even the closet?... (e.g. yes/no)"
    bool = gets.strip
    return reset if bool == 'skip'
    if bool == "yes"
      log 'config/health/men', ADDITIVE
    else
      p "Go clean closet..."
      clean_closet
    end
    reset
  end

  def work
    p "Start some work"
    p "Do something mentally HARD..."
    p "Did you get some productive work done? (e.g. 'I did x,y,z')"
    bool = gets.strip
    return reset if bool == 'skip'
    unless bool == "no"
      log 'config/health/men', ADDITIVE
    else
      p "Get back to work until you can answer yes"
      work
    end
    reset
  end

  def read_spirit
    p "Grab a spiritual text"
    p "Did you read 1 page at minimum? (e.g. yes/no)"
    bool = gets.strip
    return reset if bool == 'skip'
    if bool == "yes"
      log 'config/health/spir', ADDITIVE
    else
      p "Start reading at least 1 page or 1 article..."
      read_spirit
    end
    reset
  end

  def meditate
    p "You know what meditating is..."
    p "Did you meditate for at least 1min? (e.g. yes/no)"
    bool = gets.strip
    return reset if bool == 'skip'
    if bool == "yes"
      log 'config/health/emo', ADDITIVE
    else
      p "Start meditating brother... it only takes 1min"
      meditate
    end
    reset
  end

  def read_nonfic
    p "Read something goooood"
    p "Did you read at least 1 page or article? (e.g. yes/no)"
    bool = gets.strip
    return reset if bool == 'skip'
    if bool == "yes"
      log 'config/health/intel', ADDITIVE
    else
      p "Get back to work until you can answer yes"
      read_nonfic
    end
    reset
  end

  def kung_fu_tai_chi
    p "Prepare to practice Kung Fu or Tati Chi"
    p "Did you practice Kung Fu or Tai Chi for at least 1min? (e.g. yes/no)"
    bool = gets.strip
    return reset if bool == 'skip'
    if bool == "yes"
      log 'config/health/spir', ADDITIVE
    else
      p "Go practice it only takes 1 minute"
      p "Don't forget to pull up a youtube vid if you need"
      kftc
    end
    reset
  end

  def journal
    p "Prepare to start journaling"
    p "Did you journal (digital or analog) for a few pages?"
    bool = gets.strip
    return reset if bool == 'skip'
    if bool == "yes"
      log 'config/health/emo', ADDITIVE
    else
      p "Go write something down"
      p "It only takes 30seconds to write something down"
      kftc
    end
    reset
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
