require 'sinatra'
require 'sinatra/contrib'
require 'yaml'
require_relative '../config/globals'
require 'rack/csrf'
require 'chartkick'
require 'active_support'
require 'active_support/core_ext/numeric/conversions'
include Chartkick::Helper
require_relative '../config/cmd_act_map'

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
  @habits = CmdActMap.new.t.values
  @sleep  = File.read('config/indiv/sleep.txt').to_f.round(2)
  @eps    = File.read('config/indiv/eps.txt').to_f.round(2)
  @vids   = File.read('config/indiv/vids.txt').to_f.round(2)
  @feats  = File.read('config/indiv/feats.txt').to_f.round(2)
  @artics = File.read('config/indiv/artics.txt').to_f.round(2)
  @chaps  = File.read('config/indiv/chaps.txt').to_f.round(2)
  @rev    = File.read('config/indiv/rev.txt').to_f
  @cash   = File.read('config/indiv/cash.txt').to_f
  erb :home
end

get '/reports' do
  @name   = Globals::NAME
  @title = "Deployments per day"
  @ddata = {'2015-07-20 00:00:00 UTC' => 2, '2015-07-21 00:00:00 UTC' => 4, '2015-07-22 00:00:00 UTC' => 1, '2015-07-23 00:00:00 UTC' => 7}
  erb :reports
end

