require 'spec_helper'

describe Tag do
  fixtures :tags
  
  context "ツイートを検索する" do
    before do
      @tag = Tag.first
    end
    
    it "tweets" do
      pending "TwitterAPIのテストの書き方がわからない"
      @tag.tweets.should == ["testツイート"]
    end
  end
end
