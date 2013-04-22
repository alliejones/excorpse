class Step < ActiveRecord::Base
  attr_accessor :image_data
  attr_accessible :contents, :sequence_id, :game_id, :user_id, :image, :image_data
  has_attached_file :image,
    :styles => { :preview => '' },
    :convert_options => { :preview => '-crop 725x25+0+325' }

  belongs_to :sequence
  belongs_to :user

  def save_image(image_data)
    image_data = image_data.split(',').pop
    self.image = Paperclip::string_to_file('image.png', 'img/png', image_data)
    return self.save
  end
end
