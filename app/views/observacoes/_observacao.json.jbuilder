json.extract! observacao, :id, :descricao, :ano, :mes, :created_at, :updated_at
json.url observacao_url(observacao, format: :json)