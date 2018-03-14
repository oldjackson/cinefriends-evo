json.shows do
  json.array! @shows do |show|
    json.id show.id
    # binding.pry
    json.time show.uf_time
  end
end
