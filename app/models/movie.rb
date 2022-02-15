class Movie < ApplicationRecord
	# has_many mehtod specifies a one to many relationship
	# appearances option specifies that one movie has many appearances
	has_many :appearances
	# actors option specifies that one movie has many movies
	# the through option specifies that the relationship exists
	# only through appearances
	has_many :actors, through: :appearances
	# validates method specifices that an movie is valid only if
	# a title, duration, rating, and release date are present
	validates :title, :duration, :rating, :release_date, presence: true
end
