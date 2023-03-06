class MoviesController < ApplicationController
  def index
    @movies = Movie.order(:created_at)
  end
end
