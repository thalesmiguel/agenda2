class RelatoriosController < ApplicationController

  def imprimir_agenda
    @eventos = Evento.all
    @eventos_json = render_to_string( template: 'relatorios/agenda/agenda_padrao.json.jbuilder', locals: { eventos: @eventos }, exclude: 'url')
    @ano = params['ano']
    @meses = params['meses']

    respond_to do |format|
      format.pdf do
        render pdf: "agenda",
               layout: "impressao",
               file: "relatorios/agenda/agenda_padrao.html.erb",
               orientation: 'Landscape',
               page_size: 'A4',
               show_as_html: params.key?('debug'),
               window_status: "pronto"
      end
    end
  end

  def agenda_padrao
    @eventos = Evento.all
    respond_to do |format|
      format.json { render file: "relatorios/agenda/agenda_padrao.json.jbuilder" }
    end
  end

end
