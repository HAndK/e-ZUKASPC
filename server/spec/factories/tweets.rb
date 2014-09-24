FactoryGirl.define do
	factory :tweet do
		sequence(:text) {|n| "ツイートの内容 #{n}"}
		hashtags ['aaa','bbb','ccc']
	end

	trait :as_yeah do
		text 'yeah!!'
		hashtags ['#tweeq-1']
  end

  trait :as_yooho do
		text 'yooho!!'
		hashtags ['#tweeq-2']
  end
end