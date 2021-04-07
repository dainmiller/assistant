require_relative '../db/database'

class Logger < Decorator
  attr_accessor :database
  
  RELATIVE_CONFIG_PATH = "../config/health"

  def initialize
    @database = Database.new
  end

  def men   ; File.read("config/health/men.txt").strip                      ; end
  def emo   ; File.read("config/health/emo.txt").strip                      ; end
  def phys  ; File.read("config/health/phys.txt").strip                     ; end
  def spir  ; File.read("config/health/spir.txt").strip                     ; end
  def intel ; File.read("config/health/intel.txt").strip                    ; end
  def files ; { phys: phys, men: men, emo: emo, intel: intel, spir: spir }  ; end

  def increase_score file, addition
    current = File.read("config/health/#{file}.txt").to_f
    p "------------------------------------------------------"
    p "You went from a '#{file} health' score of: #{current}"
    p "To the increased score..#{current+addition}"
    File.write("config/health/#{file}.txt", current+addition)
    @database.save(file, addition)
  end
end
