Split::Dashboard.use Rack::Auth::Basic do |username, password|
  username == ENV['split_username'] && password == ENV['split_password']
end

Split.redis = ENV["REDISTOGO_URL"] if ENV["REDISTOGO_URL"]

Split.configure do |config|
  config.db_failover = true # handle redis errors gracefully
  config.db_failover_on_db_error = proc{|error| Rails.logger.error(error.message) }
  config.allow_multiple_experiments = true # It's fine for me, but might not for you
  config.enabled = true
end