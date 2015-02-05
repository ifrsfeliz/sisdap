json.array!(@supplier_groups) do |supplier_group|
  json.extract! supplier_group, :id, :nome
  json.url supplier_group_url(supplier_group, format: :json)
end
