Swiftype.configure do |config|
  config.api_key = URI(ENV['SWIFTYPE_URL']).user
end