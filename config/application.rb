require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Hope2us
  class Application < Rails::Application
    config.autoload_paths += %W(
	    #{config.root}/app/services
	    #{config.root}/app/uploaders
	  )

    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    config.time_zone = 'Brasilia'

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :"pt-BR"

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address:              'smtp.gmail.com',
      port:                 587,
      domain:               'example.com',
      user_name:            'contato.hope2us@gmail.com',
      password:             'Campus1293',
      authentication:       'plain',
      enable_starttls_auto: true  }
  end
end
