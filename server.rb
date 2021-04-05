require 'sinatra'
require 'yaml'

get '/' do
  @db     = YAML.load(File.read('my_database.yaml'))['log']
  @men    = File.read('health/men.txt')
  @phys   = File.read('health/phys.txt')
  @spir   = File.read('health/spir.txt')
  @emo    = File.read('health/emo.txt')
  @intel  = File.read('health/intel.txt')
  @fin    = File.read('health/fin.txt')
  erb :home
***REMOVED***
