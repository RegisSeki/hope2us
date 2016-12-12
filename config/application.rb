require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Hope2us
  class Application < Rails::Application
    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    config.autoload_paths += %W(#{config.root}/services)

    config.time_zone = 'Brasilia'

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :"pt-BR"
  end
end
