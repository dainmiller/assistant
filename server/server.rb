require 'sinatra'
require 'yaml'
require_relative '../config/globals'

get '/' do
  @db     = YAML.load(File.read('db/data/my_database.yaml'))['log']
  @men    = File.read('config/health/men.txt').to_f.round(2)
  @phys   = File.read('config/health/phys.txt').to_f.round(2)
  @spir   = File.read('config/health/spir.txt').to_f.round(2)
  @emo    = File.read('config/health/emo.txt').to_f.round(2)
  @intel  = File.read('config/health/intel.txt').to_f.round(2)
  @fin    = File.read('config/health/fin.txt').to_f.round(2)
  @walk   = File.read('config/indiv/walk.txt').to_f.round(2)
  @pu     = File.read('config/indiv/push_ups.txt').to_f.round(2)
  @name   = Globals::NAME
  erb :home
end
