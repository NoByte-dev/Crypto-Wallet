module ApplicationHelper
  def locale_set_flag
    I18n.locale.to_s == 'pt-BR' ? '&#x1F1E7&#x1F1F7'.html_safe : '&#x1F1FA&#x1F1F8'.html_safe
  end  
end
