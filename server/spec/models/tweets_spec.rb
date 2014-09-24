require 'rails_helper'

describe Tweet do
	describe '#create' do
		example 'ツイートの内容を登録できること' do
			t = build(:tweet)
			u = create(:user)

			puts "*********"
			p t
			p u
			puts "*********"

			u.tweets.create!(text: t.text, hashtags: t.hashtags)
		end
	end  
end
