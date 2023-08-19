# Load the Rails application.
require_relative "application"

# Load the app's custom environment variables here, so that they are loaded before environments/*.rb
env_var = File.join(Rails.root, 'config', 'env_var.rb')
load(env_var) if File.exists?(env_var)

# Initialize the Rails application.
Rails.application.initialize!
