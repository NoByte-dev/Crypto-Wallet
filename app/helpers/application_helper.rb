module ApplicationHelper
  def locale_is
    I18n.locale.to_s == 'pt-BR' ? 'Português do Brasil' : 'Inglês dos EUA'
  end
end
