# see
# GitHub https://github.com/sferik/twitter
# Document http://rdoc.info/gems/twitter
class TwitterClient
  include Singleton
  
  def search(word)
    client.search(word)
  end
  
  private 
  
  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_api_key
      config.consumer_secret     = Rails.application.secrets.twitter_api_secret
    end
  end
end
