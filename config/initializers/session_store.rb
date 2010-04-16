# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ritzylunch_session',
  :secret      => '151305ebed820a7504cc1c6f28495387096808bf639dca42ee9b41ea65a426348237d582af6dfe95bd3a3c0d89cf065ca551758c25d3b95aa5adc5ebe9a34924'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
