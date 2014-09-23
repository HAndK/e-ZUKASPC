class Tweet < ActiveRecord::Base
	belongs_to :user
	belongs_to :room

	after_create :notice

	def self.create(params)
		# hash -> オブジェクト変換
		tweet = Tweet.new(params[:tweet])

		# ルームの取り出し
		rooms = Room.hash_tag_in(tweet.hashtags)
		return if rooms.empty?

		# ユーザ情報の更新
		user = User.find_by(screen_name: params[:user][:screen_name])
		if user then
			user.update!(params[:user])
		else
			user = User.create!(params[:user])
		end

		# ツイートを登録
		tweet.user = user
		tweet.room = rooms.first
		tweet.save! 

		tweet
	end

	private
	def notice
		Pusher[self.room.hash_tag.delete('#')].trigger('create', 
			{
			  tweet: self.attributes,
			  user: self.user.attributes,
			  room: self.room.attributes
			})
	end
end
