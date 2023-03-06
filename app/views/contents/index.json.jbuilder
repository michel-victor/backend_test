json.contents do
  json.array! @contents, partial: "contents/content", as: :content
end