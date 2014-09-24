require 'rails_helper'

describe Tweet do
	let(:user_a){ attributes_for(:user)}		
	let(:yeah){ attributes_for(:tweet, :as_yeah) }
	let(:yooho){ attributes_for(:tweet, :as_yooho) }

	describe '#create' do
		context '部屋が用意されていない' do
			example 'nilを返すこと' do
				expect(Tweet.create({tweet:yeah, user:user_a})).to be_nil
			end
		end

		context 'はじめてのツイート' do
			before do
				create(:room, :as_room1)
				Tweet.create({tweet:yeah, user:user_a})
			end
			let(:tweet){Tweet.find_by(text:'yeah!!')}
			example 'ユーザを登録すること' do
				expect( tweet.user.screen_name ).to eq 'ttigawa'
			end
			example 'ツイートを登録すること' do
				expect( tweet.text ).to eq 'yeah!!'
			end
		end

	  context '２回目のツイート' do
	  	before do
	  		create(:room, :as_room1)
	  		create(:room, :as_room2)
	  		Tweet.create({tweet:yeah, user:user_a})
	  		Tweet.create({tweet:yooho, user:user_a})
	  	end
	  	let(:tweet){Tweet.find_by(text:'yooho!!')}
			example '既に登録されているユーザを参照すること' do
				expect( tweet.user.screen_name ).to eq 'ttigawa'
			end
			example 'ツイートを登録すること' do
				expect( tweet.text ).to eq 'yooho!!'
			end
	  end
	end
end
