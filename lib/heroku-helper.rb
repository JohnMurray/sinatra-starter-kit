require 'uri'


##----
## Author: John Murray
## Purpose: 
##     This contains some helper methods that make working
##     within the Heroku environment a little better. For
##     me, this means I can get the DB environment settings
##     in a way that doesn't seem hacked together. This is a
##     living document... so there will be more to come.
##----
class HerokuHelper
  
  class <<self
    
    ##----
    ## Load the DB setting necessary for ActiveRecord from
    ## the Heroku environment variables/settings.
    ##----
    def get_db_env( settings = {} )
      #define some default settings
        #none right now..
      
      #load the Heroku information
      env_settings = Hash.new
      if ENV['DATABASE_URL']
        db = URI.parse(ENV['DATABASE_URL'])
        env_settings = {
          :adapter        =>  db.scheme == 'postgres' ? 'postgresql' : db.scheme,
          :host           =>  db.host,
          :username       =>  db.user,
          :password       =>  db.password,
          :database       =>  db.path[1..-1],
          :encoding       =>  'utf-8'
        }
      end
      
      env_settings
    end
    
    
    ##----
    ## Check to see if we are inside the Heorku environment
    ##----
    def in_heroku?
      (ENV["HEROKU_UPID"] || ENV["HEROKU_SLUG"] || ENV["HEROKU_RACK"]) != nil
    end
    
  end
  
end