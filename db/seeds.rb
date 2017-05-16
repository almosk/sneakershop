# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rake::Task['db:drop'].invoke
Rake::Task['db:create'].invoke
Rake::Task['db:migrate'].invoke

def upload_fake_image
  uploader = ImageUploader.new(Sneaker.new, :image)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/tasks/sneakers', '*')).sample))
  uploader
end

def upload_fake_logo
  uploader = LogoUploader.new(Brand.new, :logo)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/tasks/brands', '*')).sample))
  uploader
end

def random_brand_id
  Brand.offset(rand(Brand.count)).first.id
end

Brand.create([
  {
    name: 'Adidas',
    logo: upload_fake_logo
  },{
    name: 'Asics',
    logo: upload_fake_logo
  },{
    name: 'Brooks',
    logo: upload_fake_logo
  },{
    name: 'Converse',
    logo: upload_fake_logo
  },{
    name: 'DC',
    logo: upload_fake_logo
  },{
    name: 'Fila',
    logo: upload_fake_logo
  },{
    name: 'Keds',
    logo: upload_fake_logo
  },{
    name: 'Merrell',
    logo: upload_fake_logo
  },{
    name: 'New Balance',
    logo: upload_fake_logo
  },{
    name: 'Nike',
    logo: upload_fake_logo
  },{
    name: 'Reebok',
    logo: upload_fake_logo
  },{
    name: 'Umbro',
    logo: upload_fake_logo
  },{
    name: 'Under Armour',
    logo: upload_fake_logo
  },{
    name: 'Vans',
    logo: upload_fake_logo
  }
])

@sneaker_name = ['NMD_R2 PRIMEKNIT','GEL-QUANTUM 360 KNIT','1978 New Balance','574 Retro Sport','TRIPLE LEATHER','999 Classic']
@sneaker_price = ['7','7.5','8','8.5','9','9.5','10','10.5','11']
@sneaker_sex = ['Men', 'Women']

def create_sneaker
  Sneaker.create(
    model: @sneaker_name.sample,
    brand_id: random_brand_id,
    price: @sneaker_price.sample,
    sex: @sneaker_sex.sample,
    image: upload_fake_image
  )
end

16.times do
  create_sneaker
  puts "Sneaker created"
end
