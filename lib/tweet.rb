#!/usr/bin/env ruby
require File.join(File.dirname(__FILE__), 'config_store')
require "rubygems"

require "activerecord"
require "twitter"

ActiveRecord::Base.establish_connection(
  :adapter => :mysql,
  :encoding => :utf8,
  :reconnect => false,
  :database => 'saudi_tweets_development',
  :username => 'root',
  :password => '',
  :socket => '/tmp/mysql.sock'
)

class Tweet < ActiveRecord::Base   
  validates_uniqueness_of :status_id
end

config = ConfigStore.new("#{RAILS_ROOT}/config/twitter.yml")

oauth = Twitter::OAuth.new(config['token'], config['secret'])
oauth.authorize_from_access(config['atoken'], config['asecret'])
@client = Twitter::Base.new(oauth)
