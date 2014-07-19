class Tag < ActiveRecord::Base
  # ツイートを検索する
  def tweets
    TwitterClient.instance.search("#" + name).map do |tweet|
      {text: tweet.text}
    end
  end
  
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
