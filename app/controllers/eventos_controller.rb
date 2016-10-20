class EventosController < ApplicationController
  before_action :set_evento, only: [:show, :edit, :update, :destroy]

  include ThinreportsHelper

  def index
    @eventos = Evento.all

    respond_to do |format|
      format.html
      format.json
      format.pdf do
        send_data imprimir_calendario('calendario', params[:ano], params[:meses_array], @eventos), filename: 'calendario.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  def new
    @evento = Evento.new
    @estados = Estado.all
    @cidades = Cidade.where("estado_id = ?", @estados.first)
    render_modal
  end

  def edit
    @evento = Evento.find(params[:id])
    @estados = Estado.all
    @cidades = Cidade.where("estado_id = ?", @evento.cidade.estado_id)
    render_modal
  end

  def create
    @evento = Evento.new(evento_params)

    respond_to do |format|
      if @evento.save
        format.js { render file: "eventos/success.js.erb", locals: { notice: 'Leilão foi criado com sucesso.', metodo: 'Criar' } }
      else
        format.js { render file: "eventos/errors.js.erb" }
      end
    end
  end

  def update
    respond_to do |format|
      if @evento.update(evento_params)
        format.js { render file: "eventos/success.js.erb", locals: { notice: 'Leilão foi alterado com sucesso.', metodo: 'Alterar' } }
      else
        format.js { render file: "eventos/errors.js.erb" }
      end
    end
  end

  def destroy
    @evento.destroy
    respond_to do |format|
      # format.json { head :no_content }
      format.js { render file: "eventos/success.js.erb", locals: { notice: 'Leilão excluído com sucesso.', metodo: 'Excluir' } }
    end
  end

  def update_cidades
    @cidades = Cidade.where("estado_id = ?", params[:estado_id]).order(:nome)
    respond_to do |format|
      format.js { render file: "eventos/update_cidades.js" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      @evento = Evento.find(params[:id])
    end

    def render_modal
      respond_to do |format|
        format.js { render file: "eventos/show_modal.js.erb" }
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evento_params
      params.require(:evento).permit(:nome, :canal, :cidade_id, :data, :aprovado)
    end
end
