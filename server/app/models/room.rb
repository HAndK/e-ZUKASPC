class Room < ActiveRecord::Base
	has_many :tweets, dependent: :destroy

	scope :hash_tag_in, ->(hash_tags){ where("hash_tag in (?)", hash_tags) }
end