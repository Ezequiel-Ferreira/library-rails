require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "GET /books" do
    it "returns a list of books" do
      # Criamos 3 livros no banco de dados de teste
      create_list(:book, 3)

      get books_path

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response.size).to eq(3)
    end
  end
end