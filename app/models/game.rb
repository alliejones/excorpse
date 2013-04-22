class Game < ActiveRecord::Base
  attr_accessible :complete

  has_attached_file :image, styles: {thumb: "260x"}
  has_many :steps
  has_many :users, :through => :steps

  def create_image
    image_list = []
    self.steps.each { |step| image_list << step.image.path }
    complete_image = Magick::ImageList.new(*image_list).append true

    file = Tempfile.new('complete_image.png')
    complete_image.write(file.path)

    self.image = file
    return self.save
  end
end
