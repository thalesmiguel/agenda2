class UsuariosController < ApplicationController
  include ApplicationHelper
  before_action :checa_administrador?
  before_action :set_usuario, only: [:destroy]

  def index
    @usuarios = Usuario.all
  end

  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuário excluído.' }
    end
  end

  private

  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins only!'
  end

  def set_usuario
    @usuario = Usuario.find(params[:id])
  end


end
