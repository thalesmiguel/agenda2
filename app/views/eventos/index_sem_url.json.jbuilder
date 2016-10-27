json.array!(@eventos) do |evento|
  json.extract! evento, :id, :canal, :cidade_id, :aprovado
  json.title evento.nome
  json.start evento.data
  json.end evento.data

  json.backgroundColor evento.cor_canal
end
