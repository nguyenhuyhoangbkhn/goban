class Image < ActiveRecord::Base
  belongs_to :hotels
  mount_uploader :picture, PictureUploader
end
