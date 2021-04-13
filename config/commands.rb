require 'yaml'

class Hash
  def then &block
    block.call
  end
end

class Commands

  ADDITIVE = '0.01'.to_f.freeze

  attr_reader :actions

  @@commands = [
    :walk,
    :water,
    :clean,
    :clean_closet,
    :work,
    :read_spirit,
    :meditate,
    :kung_fu_tai_chi,
    :read_nonfic,
    :journal,
    :brush_teeth,
    :wash_face,
    :push_ups,
    :deep_work,
    :sleep,
    :episodes,
    :videos,
    :features,
    :articles,
    :chapters,
    :revenue,
    :collected,
  ]

  def initialize(logger:)
    @logger = logger
  end

  # API ux improvements
  def cli   ; skipper ; end
  def open  ; skipper ; end
  def start ; skipper ; end
  def reset ; skipper ; end

  def actions
    @@commands
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
    @@commands.each_with_index do |action, cmdNumber|
      p "#{cmdNumber}. #{action}"
    end
    execute gets.strip
  end

  def collected
    p "How much cash did you collect?"
    cash = gets.strip.to_f
    if cash
      if cash > 0
        log 'config/health/fin', 0.1
      end
      log 'config/indiv/cash', cash
    end
    reset
  end

  def revenue
    p "How much revenue did you close?"
    count = gets.strip.to_f
    if count
      if count > 0
        log 'config/biz/content_marketing', 0.1
      end
      log 'config/indiv/rev', count
    end
    reset
  end

  def episodes
    p "How many episodes did you publish?"
    count = gets.strip.to_f
    if count
      if count > 0
        log 'config/biz/content_marketing', 0.1
      end
      log 'config/indiv/eps', count
    end
    reset
  end

  def videos
    p "How many videos did you publish?"
    count = gets.strip.to_f
    if count
      if count > 0
        log 'config/biz/content_marketing', 0.1
      end
      log 'config/indiv/vids', count
    end
    reset
  end

  def features
    p "How many Features did you develop?"
    count = gets.strip.to_f
    if count
      if count > 0
        log 'config/biz/product', 0.1
      end
      log 'config/indiv/feats', count
    end
    reset
  end

  def articles
    p "How many Articles did you publish?"
    count = gets.strip.to_f
    if count
      if count > 0
        log 'config/biz/content_marketing', 0.1
      end
      log 'config/indiv/artics', count
    end
    reset
  end

  def chapters
    p "How many Chapters did you write?"
    count = gets.strip.to_f
    if count
      if count > 0
        log 'config/biz/product', 0.1
      end
      log 'config/indiv/chaps', count
    end
    reset
  end

  def sleep
    p "How long did you sleep (in hours.minutes)?"
    hours = gets.strip.to_f
    if hours
      if hours > 5 and hours < 7
        log 'config/health/phys', 0.1
      elsif hours >= 7
        log 'config/health/phys', 0.15
      end
      log 'config/indiv/sleep', hours
    end
    reset
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
      log 'config/health/men', ADDITIVE
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
    if cmd_exists?(choice)
      choice = choice.to_i
      send(@@commands[choice])
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
    v = @@commands[choice.to_i]
    return false if v.nil?
    true
  end

  protected

  def method_missing method_name, *args, &block
    skipper
  end

end
