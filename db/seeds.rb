# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Item.create([
  { name: 'Fogão', description: '4 bocas', amount: 1 },
  { name: 'Microfone s/ fio', description: 'lapela ou para instrumento', amount: 10 },
  { name: 'Lixeira', description: 'com pedal cromada', amount: 20 }
])

items = Item.create([
  { name: 'Microondas', description: '30 litros', amount: 1, confirmed: 1 },
  { name: 'Cadeira', description: 'com encosto estofado', amount: 300, confirmed: 100 },
  { name: 'Geladeira', description: 'Frost free 122 litros', confirmed: 2 }
])

user = User.create(name: 'Doador', email: 'doador@email.com', password: 'doador')

items.each do |item|
	Donation.create(
		user: user,
		item: item,
		date_of_delivery: Time.now.to_datetime,
		amount: item.reserved,
		image: 'receipt.jpg',
		status: 'confirmed'
	)

  AdminUser.create([
    { email: 'admin.user@gmail.com', password: '123456789'}
    ])
end
