class User
  include Mongoid::Document
  field :username, type: String
  field :email, type: String

  has_many :posts
end
