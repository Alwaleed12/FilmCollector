class Rating < ApplicationRecord
	  # movie option specifies that one appearance has one movie
    belongs_to :movies

    validates :movie, :rating, presence: true
end
