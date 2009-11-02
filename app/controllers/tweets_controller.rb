class TweetsController < ApplicationController
  def index
    @last_tweet = Tweet.last_tweet.first
    @tweets = Tweet.find(:all, :order => 'status_created_at DESC', :limit => 30)
  end
  
  def list
  end
end
