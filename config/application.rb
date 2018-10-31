require_relative 'boot'

require 'rails/all'

# Load the dotenv gem
require 'dotenv'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Socify
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # This tells dotenv to read the .env file and set the appropriate values in ENV
    Dotenv.load *Dir.glob(Rails.root.join("config/environments/#{Rails.env}.env"), File::FNM_DOTMATCH)

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
