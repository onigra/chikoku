require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module ChikokuNotification
  class Application < Rails::Application

    # generators
    config.generators do |g|
      g.test_framework :rspec
      g.view_specs false
    end

    # timezone
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    # i18n
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    I18n.enforce_available_locales = true
    config.i18n.default_locale = :ja

    # autoload 
    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    config.autoload_paths += Dir["#{config.root}/app/validators"]

    config.active_record.raise_in_transactional_callbacks = true
  end
end
