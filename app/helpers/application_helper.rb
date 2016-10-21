module ApplicationHelper

  def link_to_icon(link_text, link_source, icon)
    link_to link_source do
      "<i class='material-icons'>add</i> #{link_text}".html_safe
    end
  end

  def checa_administrador?
    if signed_in?
      raise 'Não é Administrador!' unless current_usuario.administrador?
    end
  end

  def checa_pode_incluir?
    if signed_in?
      raise 'Não pode Incluir!' unless current_usuario.administrador?
    end
  end
end
