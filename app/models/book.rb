class Book < ActiveRecord::Base
  attr_accessible :title, :author, :description, :ISBN, :cover

  mount_uploader :cover, CoverUploader
end
