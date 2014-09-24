FactoryGirl.define do
	factory :tweet do
		sequence(:text) {|n| "ツイートの内容 #{n}"}
		hashtags ['aaa','bbb','ccc']
	end
end