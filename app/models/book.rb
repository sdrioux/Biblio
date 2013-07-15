class Book < ActiveRecord::Base
  attr_accessible :title, :author, :description, :ISBN
end
