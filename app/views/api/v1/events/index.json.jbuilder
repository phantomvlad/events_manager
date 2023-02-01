json.events @events do |event|
  json.id event.id
  json.title event.title
  json.description event.description
  json.address event.address
  json.datetime event.datetime
  json.user_id event.user_id
end
