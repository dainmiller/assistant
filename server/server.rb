require 'sinatra'
require 'yaml'

get '/' do
  @db     = YAML.load(File.read('../db/data/my_database.yaml'))['log']
  @men    = File.read('../config/health/men.txt')
  @phys   = File.read('../config/health/phys.txt')
  @spir   = File.read('../config/health/spir.txt')
  @emo    = File.read('../config/health/emo.txt')
  @intel  = File.read('../config/health/intel.txt')
  @fin    = File.read('../config/health/fin.txt')
  erb :home
***REMOVED***
