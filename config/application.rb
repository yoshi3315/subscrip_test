require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SubscripTest
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # タイムゾーンを日本時間に設定
    config.time_zone = 'Asia/Tokyo'

    # テンプレートエンジンを slim に設定
    # config.generators.template_engine = :slim

    # 国際化の日本語対応
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    # 自動生成スキップファイルの設定
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.coffee false
      g.helper false
      g.skip_routes true
      g.test_framework :rspec,
                       helper_specs: false,
                       view_specs: false,
                       controller_specs: false
    end
  end
end
