require 'sinatra'
require 'sinatra/contrib'
require 'yaml'
require_relative '../config/globals'
require 'chartkick'


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
  @deep   = File.read('config/indiv/deep_work.txt').to_f.round(2)
  @name   = Globals::NAME
  erb :home
end

get '/reports' do
  @name   = Globals::NAME
  @title = "Deployments per day"
  @ddata = {'2015-07-20 00:00:00 UTC' => 2, '2015-07-21 00:00:00 UTC' => 4, '2015-07-22 00:00:00 UTC' => 1, '2015-07-23 00:00:00 UTC' => 7}
  erb :reports
end

