# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_warehouse_two_session',
  :secret      => 'f727a8729b6d71666b15ee0a8fe1c273bef8e4ada388fbd24bc08b39d4ff0bd60ae8621d17c53f3a1081f301911000f04aa65a01ee7d67d85ef40ebde0bd886f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
