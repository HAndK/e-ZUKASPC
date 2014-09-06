class Tag < ActiveRecord::Base
  # ツイートを検索する
  def tweets
    TwitterClient.instance.search("#" + name).map do |tweet|
      {
        text: tweet.text,
        hashtags: tweet.hashtags.map(&:text),
        user: {
          screen_name: tweet.user.screen_name,
          name: tweet.user.name,
          profile_image_url: tweet.user.profile_image_url.to_s
        }
      }
    end
  end
  
  # route /tags
  class API < Grape::API
    format :json
    
    helpers do
      def tweets
        Tag.find(params[:tag_id]).tweets
      end
    end
    
    get "/:tag_id/tweets" do
      tweets
    end
  end
end
