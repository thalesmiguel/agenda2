module ThinreportsHelper

  def imprimir_calendario(relatorio, ano, meses, eventos)
    meses.sort()
    relatorio = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'relatorios', 'calendario', "#{relatorio}.tlf")

    calendarios = []
    meses.each { |mes| calendarios << CalendarioImpressao.new(mes: mes, ano: ano) }

    calendarios.each do |calendario|
      relatorio.list.add_row do |row|
        relatorio.list.header { |header| header.item(:mes_ano).value calendario.mes_ano_por_extenso }

        calendario.lista.each_with_index do |dia, index|
          row.item("texto_dia#{index+1}".to_sym).value dia
          row.item("dia#{index+1}".to_sym).hide if row.item("texto_dia#{index+1}".to_sym).value.nil?

          posicao = 0
          eventos.each do |evento|
            if evento.ano == calendario.ano && evento.mes == calendario.mes && evento.dia == dia
              row.item("texto_evento#{index+1}##{posicao}".to_sym).value(evento.descricao_completa).style(:bold, true)
              row.item("fundo_evento#{index+1}##{posicao}".to_sym).style(:fill_color, evento.cor_canal)
              row.item("imagem_evento#{index+1}##{posicao}".to_sym).src(File.join(Rails.root, 'app', 'relatorios', 'calendario', 'check_circle.png')) if evento.aprovado


                # row.item("texto_evento#{index+1}##{posicao}".to_sym).style(:height)
                # row.item("fundo_evento#{index+1}##{posicao}".to_sym).attributes(:height, "50")


              posicao += 1
              posicao = 0 if posicao > 2
            end
          end
        end
      end
    end
    relatorio.generate
  end
end
