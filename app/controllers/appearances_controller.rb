class AppearancesController < ApplicationController
	# index method gets called when the appearances URL is requested
	# index method is ampped to the appearances index.html.erb
	def index
		# call all method on Actor model class.
		# all method selects all of the data in the movies table
		# and returns the daa as an array of objects.
		# store the array of objects in an instance variable.
		# instance variable is available to appearances index.html.erb.
		@actors = Actor.all
		# call all method on Movie model class.
		# all method selects all of the data in the movies table
		# and returns the daa as an array of objects.
		# store the array of objects in an instance variable.
		# instance variable is available to appearances index.html.erb.
		@movies = Movie.all
		return @actors, @movies
	end

	# create method gets called when the Create buton is pushed on the
	# appearances index.html.erb
	def create
		# call constructor of Appearance model class giving it the 
		# acor id and movie id paramters input in the appearances
		# index.html.erb
		# constrctor creates Appearances model object which is stroed
		# in variable
		appearance = Appearance.new(appearance_params)
		# call save method on Appearance object
		# save method inserts the data in the Appearance model object
		# into the actor table
		if appearance.save
			# if the save method succeeds, request the appearances URL
			# which will rendor the actors index.html.erb in the browser
			redirect_to "/actors"
		else 
			# get full messages associated with errors
			# store them in a Rails flash object named errors so that
			# the full messages may be displayed in the appearances index.html.erb
			flash[:errors] = appearance.errors.full_messages
			# if the save method fails, request the appearances/new URL
			# which will rendor the apearances new.html.erb in the browser
			redirect_to "/appearances/index"
		end
	end

	private 
	def appearance_params
		# params is a Rails object that gets the specified request
		# paramters
		params.require(:appearance).permit(:actor_id, :movie_id)
	end
end
