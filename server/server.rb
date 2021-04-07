require 'sinatra'
require 'yaml'

get '/' do
  @db     = YAML.load(File.read('db/data/my_database.yaml'))['log']
  @men    = File.read('config/health/men.txt').to_f.round(2)
  @phys   = File.read('config/health/phys.txt').to_f.round(2)
  @spir   = File.read('config/health/spir.txt').to_f.round(2)
  @emo    = File.read('config/health/emo.txt').to_f.round(2)
  @intel  = File.read('config/health/intel.txt').to_f.round(2)
  @fin    = File.read('config/health/fin.txt').to_f.round(2)
  erb :home
end
