require 'spec_helper'

describe TagsController do
  include Rack::Test::Methods
  
  fixtures :tags
  
  def app
    Tag::API
  end
  
  describe Tag::API do
    describe "GET /tags/:tag_id/tweets.json" do
      describe "matsuerb" do
        before do 
          get "/#{tags(:matsuerb).id}/tweets.json"
        end

        it "status" do
          response.should be_success
        end

        it "response" do
          last_response.body.should == tags(:matsuerb).tweets.to_json
        end
      end

      describe "notfound" do
        before do
          get "/#{tags(:notfound).id}/tweets.json"
        end

        it "status" do
          response.should be_success
        end

        it "response" do
          JSON.parse(last_response.body).should == []
        end
      end      
    end
  end
end
