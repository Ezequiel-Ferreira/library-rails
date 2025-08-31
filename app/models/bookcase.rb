class Bookcase < ApplicationRecord
  has_many :books, class_name: "Book"
end
