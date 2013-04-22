module Paperclip

  # user.avatar = Paperclip::string_to_file('avatar.png', 'image/png', 'base64 string')
  def self.string_to_file(name, type, data)
    image_data = StringIO.new(Base64.decode64(data))
    file = Paperclip.io_adapters.for(image_data)
    file.content_type = type
    file.original_filename = name
    return file
  end

end