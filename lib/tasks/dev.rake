namespace :dev do
  desc "Configura ambiente de desenvolvimento"
  task setup: :environment do
    puts %x(clear)
    pastel = Pastel.new
    spinners = TTY::Spinner::Multi.new("[:spinner] Configurando ambiente de desenvolvimento!")
    sp1 = set_spinner(spinners, 'APAGANDO') { %x(rails db:drop) }
    sp2 = set_spinner(spinners, 'CRIANDO') { %x(rails db:create) }
    sp3 = set_spinner(spinners, 'CONFIGURANDO') { %x(rails db:migrate) }
    sp4 = set_spinner(spinners, 'POPULANDO') { %x(rails db:seed) }
    puts '=== Ambiente configurado ==='
  end

  def set_spinner(spinners, action)
    pastel = Pastel.new
    spinner = spinners.register("[#{pastel.green(':spinner')}] #{action} BANCO")
    spinner.auto_spin
    yield
    spinner.success
    spinner
  end
end
