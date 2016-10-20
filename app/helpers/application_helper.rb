module ApplicationHelper

  def link_to_icon(link_text, link_source, icon)
    link_to link_source do
      "<i class='material-icons'>add</i> #{link_text}".html_safe
    end
  end

end
