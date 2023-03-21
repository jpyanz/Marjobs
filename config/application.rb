require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Marjobs
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # config.assets.paths << Rails.root.join("app", "assets", "stylesheets")
    # config.assets.paths << Rails.root.join("app", "assets", "javascripts")
    # config.assets.paths << Rails.root.join("app", "assets", "images")
    # config.assets.paths << Rails.root.join("app", "assets", "videos")
    # config.assets.paths << Rails.root.join("app", "assets", "fonts")

    # use mini magick instead of vips for ror7
    config.active_storage.variant_processor = :mini_magick

    # Append active storage instead of replace
    config.active_storage.replace_on_assign_to_many = false
  end
end
