class RatingController < ApplicationController
	def index
		@movies = Movie.all
		@ratings = Rating.all

		return @movies, @ratings
	end

	def new 
	end

	
	def create
		# call constructor of Appearance model class giving it the 
		# acor id and movie id paramters input in the appearances
		# index.html.erb
		# constrctor creates Appearances model object which is stroed
		# in variable
		ratings = Rating.new(rating_params)
		# call save method on Appearance object
		# save method inserts the data in the Appearance model object
		# into the actor table
		if ratings.save
			# if the save method succeeds, request the appearances URL
			# which will rendor the actors index.html.erb in the browser
			redirect_to "/rating"
		else 
			# get full messages associated with errors
			# store them in a Rails flash object named errors so that
			# the full messages may be displayed in the appearances index.html.erb
			flash[:errors] = appearance.errors.full_messages
			# if the save method fails, request the appearances/new URL
			# which will rendor the apearances new.html.erb in the browser
			redirect_to "/rating/new"
		end
	end

	private 
	def rating_params
		# params is a Rails object that gets the specified request
		# paramters
		params.require(:rating).permit(:movie, :rating)
	end
end
