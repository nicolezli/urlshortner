Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_assets = true
  config.assets.js_compressor = :uglifier
  config.assets.css_compressor = :sass
  config.assets.compile = false
  config.assets.digest = true
  # config.force_ssl = true
  config.log_level = :info
  # config.log_tags = [ :subdomain, :uuid ]
  # config.cache_store = :mem_cache_store
  # config.action_mailer.raise_delivery_errors = false
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  # config.autoflush_log = false
  config.log_formatter = ::Logger::Formatter.new
  config.active_record.dump_schema_after_migration = false
end
