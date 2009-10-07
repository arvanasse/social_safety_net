# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_CaseManagementCore_session',
  :secret      => '81d91a85d84ae6a6c2b98af140c368ab56b4e486ae0a5122b75d064d8be07a5c391d87c5ee5927b3cee06023d1aee7b0bb985bc685ab77131993f23bb1181340'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
