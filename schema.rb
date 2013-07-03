require 'dm-migrations'
DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/db.sqlite3")

class Product
  include DataMapper::Resource

  property :id,         Serial# primary serial key
  property :name,       String
  property :title,      String
#  property :body,       Text 
  property :created_at, DateTime
  property :updated_at, DateTime

  belongs_to :category
end

class Category
  include DataMapper::Resource

  property :id,         Serial
  property :name,       String
  property :title,       String

  has n, :products
end

class User 
  include DataMapper::Resource

 property :id,           Serial# primary serial key
  property :username,     String 
  property :password,     String
  property :email,        String 
  property :created_at,   DateTime
  property :updated_at,   DateTime

end

DataMapper.finalize
#DataMapper.auto_migrate!
DataMapper.auto_upgrade!
