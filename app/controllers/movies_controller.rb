class MoviesController < ApplicationController
	# index method gets called when the movies URL is requested.
	# index methods gets mapped to the movies index.html.erb.
	def index
		# call all method on Movie model class.
		# all method selects all of the data in the movies table
		# and returns the daa as an array of objects.
		# store the array of objects in an instance variable.
		# instance variable is available to movies index.html.erb.
		@movies = Movie.all
	end

	# new method gets called when the movies/new URL is requested.
	# new method is mapped to the movies new.html.erb
	def new
	end

	# create method gets called when the Create button is pushed on
	# the movies new.html.erb.
	def create
		# call constructor of movies model class giving it the 
		# title, durating, rating and release date paramters input in the movies
		# new.html.erb
		# constrctor creates Movie model object which is stroed
		# in variable
		movie = Movie.new(movie_params)
		# call save method on Movie object
		# save method inserts the data in the Movie model object
		# into the movie table
		if movie.save
			# if the save method succeeds, request the movies URL
			# which will rendor the movies index.html.erb in the browser
			redirect_to "/movies"
		else 
			# get full messages associated with errors
			# store them in a Rails flash object named errors so that
			# the full messages may be displayed in the movies new.html.erb
			flash[:errors] = movie.errors.full_messages
			# if the save method fails, request the movies/new URL
			# which will rendor the mvoies new.html.erb in the browser
			redirect_to "/movies/new"
		end
	end

	# show method gets called when the movies/:id URL is requested 
	# show method is mappled to the movies show.html.erb
	def show
		# call find method on Movies model class giving it the id sent
		# in the request
		# find method selects all of the data in the movie table where
		# the id is equal to the id sent in the request 
		# selected data will be reutrned in an array of movie objects 
		# store the array of movie objects in an instance variable 
		# instance variable is available to movies show.html.erb
		@actors = Movie.find(params[:id]).actors
	end 

	def edit
		@movie = Movie.find(params[:id])
	end

	# update method gets called when the Update button is pushed on the 
	# movies edit.html.erb
	def update
		# call find method on Movie model class giving it the id sent in the 
		# request
		# find method selects all of the data in the movie table where
		# the id is qual to the id sent in the request
		# the selected data will be returned as an object
		# the object will be stroed in a variable
		movie = Movie.find(params[:id])
		# call updated method on Movie object giving it the first name and
		# last name paramerters imput in the movies edit.html.erb
		# update method updates the data in the movie table use the parameters
		if movie.update(movie_params)
			# if the update method succeeds, request the movies URL which
			# will render the movies index.html.erb in the broswer
			redirect_to "/movies"
		else
			# if the updated method fails, get the full messages associated
			# with the errors
			#store them in a Rails flash, object named errors so that 
			# the full messages may be displayed in the requested URl
			flash[:errors] = movie.errors.full_messages
			redirect_to "/movies/#{movie.id}/edit"
			# request the movies/:id/edit URl which will render the movies
			# edit.html.erb
		end
	end

	def delete
		# call find method on Movie model class giving it the id sent
		# in the request
		# the find method selects all of the data in the movie table where
		# the id is equal to the id sent in the request
		# the selected data will be returned as an object
		# the object will be stored in an instance variable that will be
		# available to the delete.html.erb	
		@movie = Movie.find(params[:id])
	end

	def destroy
		movie = Movie.find(params[:id])
		movie.destroy
		redirect_to "/movies"
	end

	private 
	def movie_params
		# params is a Rails object that gets the specified request
		# paramters
		params.require(:movie).permit(:title, :duration, :rating, :release_date)
	end
end
