# see
# GitHub https://github.com/sferik/twitter
# Document http://rdoc.info/gems/twitter
class TwitterClient
  def initialize(token, secret)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_api_key
      config.consumer_secret     = Rails.application.secrets.twitter_api_secret
      config.access_token        = token
      config.access_token_secret = secret
    end
  end
  
  def search(word)
    @client.search(word, :lang => "ja")
  end
end
