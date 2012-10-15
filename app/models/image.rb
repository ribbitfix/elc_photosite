class Image < ActiveRecord::Base
  has_attached_file :photo, :styles => {thumbnail: "100x100>"}

  attr_accessible :caption, :photo



  belongs_to :user
end
