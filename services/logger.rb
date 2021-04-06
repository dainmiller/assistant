require_relative '../db/database'

class Logger < Decorator
  attr_accessor :database
  
  RELATIVE_CONFIG_PATH = "../config/health"

  def initialize
    @database = Database.new
***REMOVED***

  def men   ; File.read("config/health/men.txt").strip   ; ***REMOVED***
  def emo   ; File.read("config/health/emo.txt").strip   ; ***REMOVED***
  def phys  ; File.read("config/health/phys.txt").strip  ; ***REMOVED***
  def spir  ; File.read("config/health/spir.txt").strip  ; ***REMOVED***
  def intel ; File.read("config/health/intel.txt").strip ; ***REMOVED***
  def files ; { phys: phys, men: men, emo: emo, intel: intel, spir: spir } ; ***REMOVED***

  def increase_score file, addition
    current = File.read("config/health/#{file}.txt").to_f
***REMOVED***
    p "You went from a '#{file} health' score of: #{current}"
    p "To the increased score..#{current+addition}"
    File.write("config/health/#{file}.txt", current+addition)
    @database.save(file, addition)
***REMOVED***
***REMOVED***
