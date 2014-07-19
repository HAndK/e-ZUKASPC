require 'spec_helper'

describe Tag do
  fixtures :tags
  
  context "ツイートを検索する" do
    before do
      @tag = tags(:matsuerb)
    end
    
    it "tweets 結果あり" do
      @tag.tweets.first[:text].match(@tag.name).should_not be_nil
    end
    
    it "tweets 結果なし" do
      @tag.tweets.first[:text].match("notfound").should be_nil
    end
  end
end
