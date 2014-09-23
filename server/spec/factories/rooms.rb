FactoryGirl.define do
	factory :room do
		trait :as_room1 do
      hash_tag '#tweeq-1'
      name '講義Ａ'
      memo '講義Ａ　メモメモ'
    end

		trait :as_room2 do
      hash_tag '#tweeq-2'
      name '講義Ｂ'
      memo '講義Ｂ　メモメモ'
    end
	end
end