json.library do
  if @library.instance_of? Array
    json.array! @library do |content|
      json.set! content[:content_type] do
        json.content content[:content_title]
        json.quality content[:quality]
        json.expires content[:expires]
      end
    end
  else
    json.message @library
  end
end
