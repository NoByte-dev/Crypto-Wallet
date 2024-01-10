puts 'Iniciou'
coins_list = [
  {
    description: 'Bitcoin',
    acronym: 'BTC',
    url_image: "https://i.imgur.com/6SlORnD.png"
  },
  {
    description: 'Ethereum',
    acronym: 'ETH',
    url_image: "https://i.imgur.com/5qsogpk.png",
  },
  {
    description: 'Desh',
    acronym: 'DASH',
    url_image: "https://i.imgur.com/xDGmwaU.png",
  },
]

coins_list.each do |coin|
  coin = Coin.find_by(coin)
  if coin.nil?
    coin = Coin.create(coin)
    puts "#{coin[:description]} Cadastrado"
  end
end

coins_list.each do |coin|
  coin = Coin.find_or_create_by(coin)
  puts "#{coin[:description]} Cadastrado"
end

puts 'Terminou'