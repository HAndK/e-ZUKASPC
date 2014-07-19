require 'spec_helper'

describe TagsController do
  include Rack::Test::Methods
  
  fixtures :tags
  
  def app
    Tag::API
  end
  
  describe Tag::API do
    describe "GET /tags/:tag_id/tweets.json" do
      it "returns tweets" do
        get "/#{tags(:matsuerb).id}/tweets.json"
        last_response.status.should == 200
        last_response.body.should == tags(:matsuerb).tweets.to_json
      end
      it "returns tweets" do
        get "/#{tags(:notfound).id}/tweets.json"
        last_response.status.should == 200
        JSON.parse(last_response.body).should == []
      end
    end
  end
end
