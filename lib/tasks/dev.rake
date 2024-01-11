namespace :dev do
  @color = Pastel.new
  desc 'Configura ambiente de desenvolvimento'
  task setup: :environment do
    puts "#{@color.yellow('Configurando ambiente de desenvolvimento!')}"
    show_spinner('Apagando banco de dados!') { %x(rails db:drop) }
    show_spinner('Criando banco de dados!') { %x(rails db:create) }
    show_spinner('Configurando banco de dados!') { %x(rails db:migrate) }
    show_spinner('Populando banco de dados com Tipos de Mineração!') { %x(rails dev:seed_types) }
    show_spinner('Populando banco de dados com Moedas!') { %x(rails dev:seed_coins) }
  end

  desc 'Popular o banco de dados com tipos de mineração'
  task seed_types: :environment do
    miningtypes_list = [
      {
        description: 'Proof of Work',
        acronym: 'PoW'
      },
      {
        description: 'Proof of Stake',
        acronym: 'PoS'
      },
      {
        description: 'Proof of Capacity',
        acronym: 'PoC'
      }
    ]

    miningtypes_list.each do |mining_type|
      mining_type = MiningType.find_or_create_by(mining_type)
    end
  end

  desc 'Popular o banco de dados com moedas'
  task seed_coins: :environment do
    coins_list = [
      {
        description: 'Bitcoin',
        acronym: 'BTC',
        url_image: 'https://i.imgur.com/6SlORnD.png',
        mining_type: MiningType.all.sample
      },
      {
        description: 'Ethereum',
        acronym: 'ETH',
        url_image: 'https://i.imgur.com/5qsogpk.png',
        mining_type: MiningType.all.sample
      },
      {
        description: 'Desh',
        acronym: 'DASH',
        url_image: 'https://i.imgur.com/xDGmwaU.png',
        mining_type: MiningType.all.sample
      },
      {
        description: 'Iota',
        acronym: 'IOT',
        url_image: 'https://i.imgur.com/zgcUEgs.png',
        mining_type: MiningType.all.sample
      },
      {
        description: 'Zcash',
        acronym: 'ZAC',
        url_image: 'https://i.imgur.com/qapHkKT.png',
        mining_type: MiningType.all.sample
      }
    ]

    coins_list.each do |coin|
      coin = Coin.find_or_create_by(coin)
    end
  end

  private

  def show_spinner(action)
    spinner = TTY::Spinner.new('[:spinner] :title', success_mark: "#{@color.green('✔')}")
    spinner.update(title: "#{action}")
    spinner.auto_spin
    yield
    spinner.success
  end
end
