# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
itens = Item.create([
  { name: 'Geladeira', description: 'Frost free 122 litros', amount: 2 },
  { name: 'Microondas', description: '30 litros', amount: 2 },
  { name: 'Fogão', description: '4 bocas', amount: 1 },
  { name: 'Microfone s/ fio', description: 'lapela ou para instrumento', amount: 10 },
  { name: 'Cadeira', description: 'com encosto estofado', amount: 400 },
  { name: 'Lixeira', description: 'com pedal cromada', amount: 20 }
])
