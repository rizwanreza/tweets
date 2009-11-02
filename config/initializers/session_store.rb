# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sauditweets_session',
  :secret      => '13d35820ac139ed5221c1935d26eddefdc2dee03039c235b9c96f5011d5da53249d96f7c0c9ebd9800bb8d7ae1203e51fd5dd95297047f78a1db6b18db5da258'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
