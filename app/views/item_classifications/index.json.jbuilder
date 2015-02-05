json.array!(@item_classifications) do |item_classification|
  json.extract! item_classification, :id, :nome
  json.url item_classification_url(item_classification, format: :json)
end
