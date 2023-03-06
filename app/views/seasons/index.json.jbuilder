json.seasons do
  json.array! @seasons, partial: "seasons/season", as: :season
end