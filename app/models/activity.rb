class Activity < ApplicationRecord
	belongs_to :user
	#validates_presence_of :distance
end
