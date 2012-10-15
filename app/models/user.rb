class User < ActiveRecord::Base
  attr_accessible :fav_animal, :first_name, :last_name

  has_many :images
end
