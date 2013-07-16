class Book < ActiveRecord::Base
  attr_accessible :title, :author, :description, :ISBN, :cover, :goodreadscover

  mount_uploader :cover, CoverUploader

  belongs_to :user

  if not :ISBN.blank?

    before_create do 
      client = Goodreads::Client.new(:api_key => 'nb91JYNv6C6KVOSuj0DA', :api_secret => 'ubziSNARaHHiOseNKdzj0A1wfMYuejnsuvejGZ0Pss')
      book = client.book_by_isbn(self.ISBN)
      self.title = book.title if self.title.blank?
      if self.author.blank?
        if book.authors.author.is_a?(Array)
          self.author = book.authors.author[0].name
        else 
          self.author = book.authors.author.name
        end
      end
      self.description = Sanitize.clean(book.description) if self.description.blank?
      self.goodreadscover = book.image_url
    end
  end
end
