json.extract! content, :id, :title, :plot, :number, :_type, :created_at, :updated_at
json.url content_url(content, format: :json)
