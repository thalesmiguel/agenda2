class ObservacoesController < ApplicationController
  before_action :set_observacao, only: [:show, :edit, :update, :destroy]

  def index
    @observacoes = Observacao.all
  end

  def show
  end

  def new
    @observacao = Observacao.new
  end

  def edit
  end

  def create
    @observacao = Observacao.new(observacao_params)

    respond_to do |format|
      if @observacao.save
        format.html { redirect_to @observacao, notice: 'Observacao was successfully created.' }
        format.json { render :show, status: :created, location: @observacao }
      else
        format.html { render :new }
        format.json { render json: @observacao.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @observacao.update(observacao_params)
        format.html { redirect_to @observacao, notice: 'Observacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @observacao }
      else
        format.html { render :edit }
        format.json { render json: @observacao.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @observacao.destroy
    respond_to do |format|
      format.html { redirect_to observacoes_url, notice: 'Observacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_observacao
      @observacao = Observacao.find(params[:id])
    end

    def observacao_params
      params.require(:observacao).permit(:descricao, :ano, :mes)
    end
end
