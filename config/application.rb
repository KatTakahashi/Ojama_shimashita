require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OjamaShimashita
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.paths.add 'lib', eager_load: true # Google Vision API 用ライブラリを読み込むため

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.


    #タイムゾーンを日本に設定
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    #enum の日本語化
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config/locales/*.yml').to_s]

  end
end
