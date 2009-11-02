require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Tweet do
  before(:each) do
    @valid_attributes = {
      :status => "This is RSpec and it rocks!",
      :status_id => "99887767",
      :status_created_at => Time.now,
      :tweeters_id => "1234456",
      :tweeters_name => "RSpec Test Runner",
      :tweeters_photo => "http://www.rspec.info/avatar.jpg",
      :tweeters_screen_name => "rspectr"
    }
    @existing_tweet = Tweet.create(@valid_attributes)
  end

  it "validates uniqueness of tweeter's id" do
    new_tweet = Tweet.new(@valid_attributes)
    new_tweet.should_not be_valid
  end
  
  it "last_tweet should return one most recent tweet" do
    Tweet.last_tweet.first.status_id.should == '99887767'
  end

end
