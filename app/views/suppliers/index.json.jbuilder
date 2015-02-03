json.array!(@suppliers) do |supplier|
  json.extract! supplier, :id, :cnpj, :razao_social, :email, :telefone, :celular, :contato, :observacoes
  json.url supplier_url(supplier, format: :json)
end
