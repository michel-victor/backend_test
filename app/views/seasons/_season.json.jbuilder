json.extract! season, :id, :title, :plot, :number, :created_at, :updated_at

json.episodes do
  json.array! season.episodes do |episode|
    json.id episode.id
    json.title episode.title
    json.plot episode.plot
    json.number episode.number
    json.created_at episode.created_at
    json.updated_at episode.updated_at
  end
end
