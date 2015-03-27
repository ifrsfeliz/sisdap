json.array!(@accounting_actions) do |accounting_action|
  json.extract! accounting_action, :id, :codigo, :descricao, :exercise_id
  json.url accounting_action_url(accounting_action, format: :json)
end
