module ApplicationHelper
  def data_br(formato = 'curta')
    case formato
    when 'curta'
      Date.today.strftime('%d-%m-%Y')
    else 'completa'
      Date.today.strftime('%d-%m-%Y %H:%M') 
    end
  end
end
