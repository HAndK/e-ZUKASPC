class TagsController < ApplicationController
  def index
    @twitter_client = TwitterClient.new(session["twitter_token"], session["twitter_secret"])
  end
end
