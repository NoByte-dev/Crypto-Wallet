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
        image: 'app/assets/images/coins/bitcoin.png',
        mining_type: MiningType.all.sample
      },
      {
        description: 'Ethereum',
        acronym: 'ETH',
        image: 'app/assets/images/coins/ethereum.png',
        mining_type: MiningType.all.sample
      },
      {
        description: 'Desh',
        acronym: 'DASH',
        image: 'app/assets/images/coins/desh.png',
        mining_type: MiningType.all.sample
      },
      {
        description: 'Iota',
        acronym: 'IOT',
        image: 'app/assets/images/coins/iota.png',
        mining_type: MiningType.all.sample
      },
      {
        description: 'Zcash',
        acronym: 'ZAC',
        image: 'app/assets/images/coins/zcash.png',
        mining_type: MiningType.all.sample
      }
    ]

    coins_list.each do |coin_attributes|
      coin = Coin.find_or_initialize_by(description: coin_attributes[:description], acronym: coin_attributes[:acronym])
      coin.mining_type = coin_attributes[:mining_type]
      coin.image.attach(io: File.open(coin_attributes[:image]), filename: "#{coin.acronym.downcase}.png")
      coin.save
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
