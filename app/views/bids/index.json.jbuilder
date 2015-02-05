json.array!(@bids) do |bid|
  json.extract! bid, :id, :uasg_id, :numero, :objeto_do_pregao
  json.url bid_url(bid, format: :json)
end
