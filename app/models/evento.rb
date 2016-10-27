class Evento < ApplicationRecord
  belongs_to :cidade

  validates_presence_of :nome, :data, :canal, :cidade_id

  enum canal: [
    :agro_canal,
    :canal_do_boi,
    :canal_rural,
    :novo_canal,
    :terra_viva,
    :sem_transmissao,
    :feriado
  ]

  enum cor_canal: [
    "#2196f3",
    "#4caf50",
    "#795548",
    "#e91e63",
    "#ff9800",
    "#9e9e9e",
    "#7b1fa2"
  ]

  def estado
    cidade.nil? ? 0 : cidade.estado_id
  end

  def cor_canal
    Evento.cor_canais.keys[Evento.canais[canal]]
  end

  def hora_formatada
    data.strftime("%M") == "00" ? data.strftime("%Hh") : data.strftime("%Hh%Mmin")
  end

  def ano
    data.year.to_s
  end

  def mes
    data.month.to_s
  end

  def dia
    data.day
  end

  def descricao_completa
    "(" + hora_formatada + ") " + nome + (cidade.nome != 'Virtual' ? " - " + cidade.nome + "/" + cidade.estado.sigla : '' )
  end

end
