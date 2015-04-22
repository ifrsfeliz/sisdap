json.array!(@requests) do |request|
  json.extract! request, :id, :qtd_solicitada
  json.url request_url(request, format: :json)
end
