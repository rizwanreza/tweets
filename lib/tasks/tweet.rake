require File.join(RAILS_ROOT, 'lib', 'tweet')

namespace :app do
  desc "Automated task to get tweets from Twitter"
  task :load_tweets => :environment do
    puts "Connection established..."  
    x = 0
    @client.friends_timeline(:count => 200).each do |status|
      t = Tweet.new( :status               => status.text,
                    :status_id            => status.id,
                    :status_created_at    => status.created_at,
                    :tweeters_id          => status.user.id, 
                    :tweeters_name        => status.user.name,
                    :tweeters_photo       => status.user.profile_image_url,
                    :tweeters_screen_name => status.user.screen_name )
      if t.save
         x += 1
      end
    end
    File.open("#{RAILS_ROOT}/log/twitter-downloads.log", 'a') {|f| f.write("[#{Time.now}] #{x} tweets Downloaded.\n") }
    puts "[#{Time.now}] #{x} tweets Downloaded. Closed Connection." if ActiveRecord::Base.remove_connection
  end
  
  desc "Automated task to follow those who follow Sauditweets on Twitter"
  task :follow => :environment do
    x = 0
    @to_follow = @client.follower_ids - @client.friend_ids
    @to_follow.each do |to_follow_id|
      begin
      @client.friendship_create(to_follow_id)
      x += 1
      rescue
        next
      end
    end
    File.open("#{RAILS_ROOT}/log/twitter-follow.log", 'a') {|f| f.write("[#{Time.now}] Followed #{x} users.\n") }
    puts "[#{Time.now}] Followed #{x} users. Closed Connection." if ActiveRecord::Base.remove_connection
  end
  
  desc "Automated task to remove those who opt not to follow"
  task :unfollow => :environment do
    x = 0
    @to_unfollow = @client.friend_ids - @client.follower_ids
    @to_unfollow.each do |to_unfollow_id|
      begin
      if @client.friendship_destroy(to_unfollow_id) 
        Tweet.delete_all(["status_id = ?", to_unfollow_id])
      end
      x += 1
      rescue
        next
      end
    end
    File.open("#{RAILS_ROOT}/log/twitter-unfollow.log", 'a') {|f| f.write("[#{Time.now}] Unfollowed #{x} users.\n") }
    puts "[#{Time.now}] Unfollowed #{x} users. Closed Connection." if ActiveRecord::Base.remove_connection
  end
  
  desc "Delete blocked users' tweets"
  task :clear_blocked => :environment do
    
  end
end