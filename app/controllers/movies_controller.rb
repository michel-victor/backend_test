class MoviesController < ApplicationController
  def index
    # Ordered by createed_at from default_scope in model
    @movies = Movie.all
  end
end
