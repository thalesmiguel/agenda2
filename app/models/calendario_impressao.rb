class CalendarioImpressao
  include ActiveModel::Model

  attr_accessor :mes, :ano

  def primeiro_dia
    (Date.new(ano.to_i,mes.to_i,1) + 1.days).cwday
  end

  def dias_no_mes
    Time.days_in_month(mes.to_i,ano.to_i)
  end

  def mes_ano_por_extenso
    # I18n.t Date.new(ano.to_i, mes.to_i, 1).strftime('%B').to_s + "/" + ano.to_s
    I18n.l(Date.new(ano.to_i, mes.to_i, 1), format: "%B") + "/" + ano
  end

  def lista
    dias = (1..dias_no_mes).to_a
    dias_inicio_pad = [nil] * (primeiro_dia - 1)
    dias_fim_pad = [nil] * (42 - (dias_inicio_pad + dias).length)

    dias_inicio_pad + dias + dias_fim_pad
  end
end
