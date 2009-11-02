class Tweet < ActiveRecord::Base
  validates_uniqueness_of :status_id  
  named_scope :last_tweet, :order => 'status_created_at DESC', :limit => 1 
end
