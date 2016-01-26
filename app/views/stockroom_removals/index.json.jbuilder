json.array!(@stockroom_removals) do |stockroom_removal|
  json.extract! stockroom_removal, :id, :user_id
  json.url stockroom_removal_url(stockroom_removal, format: :json)
end
