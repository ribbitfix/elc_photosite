class Image < ActiveRecord::Base
  attr_accessible :caption, :photo

  has_attached_file :photo, :styles => {thumbnail: "100x100>"}

  validates_attachment :photo, :presence => true,
  :content_type => { :content_type => /image/ },
  :size => { :in => 0..10000.kilobytes }

  belongs_to :user

end
