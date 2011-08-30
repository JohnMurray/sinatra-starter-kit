require 'active_record'
require 'yaml'
require 'logger'
require 'uri'



##----
## SINATRA SETTINGS
##   Settings that are more specific to Sinatra than anythign else
##----
set :environment, ENV["RACK_ENV"].to_sym || :development
set :root, File.expand_path(File.join(File.dirname(__FILE__), '..'))
set :public, File.join(settings.root, 'public')
set :views, File.join(settings.root, 'views')
enable :static, :logging, :dump_errors
disable :sessions, :run
set :raise_errors, Proc.new { settings.environment == :development }
set :show_exceptions, Proc.new {settings.environment == :development }





##----
## LOGGING SETTINGS
##   Settings that have to do with logging in general
##----
set :logdir, File.join(settings.root, 'log')
if settings.environment == :production then
  $stderr.reopen File.open(File.join(settings.logdir, 'sinatra.log'), 'a')
  $stdout.reopen File.open(File.join(settings.logdir, 'sinatra.log'), 'a')
end





##----
## DB/ACTIVE RECORD SETTINGS
##   Configuration and connection settings. The first section configures the local
##   environment using sqlite and logging. The second (production) sections assumes
##   that we are running on Heroku and so we are using the provided Postgres SQL DB
##   provided.
##----
$: << File.join(settings.root, 'lib')
require 'heroku-helper'

if [:development, :test].include? settings.environment.to_sym then
  db_config = YAML::load File.open(File.join(settings.root, 'db', 'config', 'db.yml'))
  db_env = settings.environment
  db_config[db_env][:database] = File.join settings.root, 'db', 'sqlite', db_config[db_env][:database]
  ActiveRecord::Base.establish_connection(db_config[db_env])
  ActiveRecord::Base.logger = Logger.new(File.open(File.join(settings.logdir, 'database.log'), 'a'))
elsif HerokuHelper.in_heroku?
  ActiveRecord::Base.establish_connection(HerokuHelper.get_db_env)
end
