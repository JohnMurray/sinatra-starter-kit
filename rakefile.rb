require 'active_record'
require 'yaml'
require 'logger'

$: << '.'
require 'lib/heroku-helper'


task :default => "db:migrate"

namespace "db" do

  task :migrate  => :environment do
    ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
  end

  task :environment do
    if [:development, :test].include? settings.environment.to_sym
      db_env = ENV["env"] || ENV["environment"] || :development
      db_env = db_env.to_sym
      db_conf = YAML::load(File.open('db/config/db.yml'))[db_env]
      db_conf[:database] = "db/sqlite/#{db_conf[:database]}"
      ActiveRecord::Base.establish_connection(db_conf)
      ActiveRecord::Base.logger = Logger.new(File.open('log/database.log', 'a'))
    elsif HerokuHelper.in_heroku?
      ActiveRecord::Base.establish_connection(HerokuHelper.get_db_env)
    end
  end

end
