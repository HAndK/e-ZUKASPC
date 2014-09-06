client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = Rails.application.secrets.twitter_api_key
  config.consumer_secret     = Rails.application.secrets.twitter_api_secret
end
client.filter(:track => "coffee,tea") do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end
