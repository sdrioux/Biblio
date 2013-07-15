class Book < ActiveRecord::Base
  attr_accessible :title, :author, :description, :ISBN

  mount_uploader :cover, CoverUploader
end
