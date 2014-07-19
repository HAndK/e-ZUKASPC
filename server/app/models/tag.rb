class Tag < ActiveRecord::Base
  # ツイートを検索する
  def tweets
    TwitterClient.instance.search("#" + name).map(&:text)
  end
end
