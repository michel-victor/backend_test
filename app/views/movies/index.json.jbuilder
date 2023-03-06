json.movies do
  json.array! @movies, partial: "movies/movie", as: :movie
end