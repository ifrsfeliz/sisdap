json.array!(@items) do |item|
  json.extract! item, :id, :item, :item_classification_id, :descricao, :supplier_id, :validade, :unidade, :quantidade, :valor_unitario, :tipo, :observacao, :ativo
  json.url item_url(item, format: :json)
end
