class Book < ApplicationRecord
  belongs_to :bookcase
  belongs_to :author
  
  validate :is_the_bookcase_on_limit


  def is_the_bookcase_on_limit()
    if (self.bookcase.books.count >= self.bookcase.limit)
      errors.add(:base, "A estante já está preenchida, não cabe mais livros!")
    end
  end
end
