class Image < ActiveRecord::Base
  belongs_to :user
  attr_accessible :caption, :photo, :processing

  has_attached_file :photo, :styles => {thumbnail: "100x100>"}

  validates_attachment :photo, :presence => true,
  :content_type => { :content_type => /image/ },
  :size => { :in => 0..10000.kilobytes }
  
  before_photo_post_process do |image|
    puts image.id.to_s + " before process " + image.processing.to_s
    if !image.processing #&& image.image_changed?
      image.processing = true
      false
    end
  end

#  after_image_post_process do |image|
#    image.processing = false
#  end

#  after_save do |image|
#    if image.processing
#      puts image.id.to_s + " adding job."
#      processPhotoJob(image)
    
#    end
#  end

  def processPhotoJob(image)
    image.regenerate_styles!
  end
  handle_asynchronously :processPhotoJob

  def regenerate_styles!
    self.photo.reprocess!
    self.processing = false
    puts "regenerate processing" + self.processing.to_s
    self.save(:validations => false)
  end

  def image_changed?
    self.photo_file_size_changed? ||
    self.photo_file_name_changed? ||
    self.photo_content_type_changed? ||
    self.photo_updated_at_changed?
  end

end
