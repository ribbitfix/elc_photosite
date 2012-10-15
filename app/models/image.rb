class Image < ActiveRecord::Base
  attr_accessible :caption

  belongs_to :user
end
