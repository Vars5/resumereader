Split::Dashboard.use Rack::Auth::Basic do |username, password|
  username == ENV['split_username'] && password == ENV['split_password']
end

Split.redis = REDIS