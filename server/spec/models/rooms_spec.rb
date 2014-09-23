require 'rails_helper'

describe Room do
	before do
		create(:room, :as_room1)
		create(:room, :as_room2)
	end

	describe 'hash_tag_in' do
		example '有効なルームがない場合、nilを返すこと' do
			expect(Room.hash_tag_in(['aaa','bbb'])).to be_empty
		end

		example '有効なルームがある場合、１件返すこと' do
			expect(Room.hash_tag_in(['aaa','tweeq#1','ccc']).size).to eq(1) 
		end

		example '有効なルームがある場合、返すルームのハッシュタグが正しいこと' do
			expect(Room.hash_tag_in(['aaa','tweeq#1','ccc']).first.hash_tag).to eq('tweeq#1') 
		end
	end
end