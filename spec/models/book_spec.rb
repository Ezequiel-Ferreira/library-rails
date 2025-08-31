require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    let(:bookcase) { create(:bookcase, limit: 2) }
    let(:author) { create(:author) }

    it 'is valid when the bookcase is not full' do
      create(:book, bookcase: bookcase, author: author)
      book = build(:book, bookcase: bookcase, author: author)
      expect(book).to be_valid
    end

    it 'is invalid when the bookcase is full' do
      create_list(:book, 2, bookcase: bookcase, author: author)
      book = build(:book, bookcase: bookcase, author: author)
      expect(book).not_to be_valid
      expect(book.errors[:base]).to include('A estante já está preenchida, não cabe mais livros!')
    end
  end
end