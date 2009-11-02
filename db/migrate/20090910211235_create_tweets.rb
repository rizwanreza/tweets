class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.text :status
      t.string :status_id
      t.datetime :status_created_at
      t.string :tweeters_id
      t.string :tweeters_name
      t.string :tweeters_photo
      t.string :tweeters_screen_name

      t.timestamps
    end
  end

  def self.down
    drop_table :tweets
  end
end
