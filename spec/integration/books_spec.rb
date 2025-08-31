require 'swagger_helper'

RSpec.describe 'Books API', type: :request do
  path '/books' do
    get('list books') do
      tags 'Books'
      security [ bearerAuth: [] ]   # 🔐 Aqui ativa o Bearer Token
      produces 'application/json'

      response(200, 'successful') do
        let(:Authorization) { "Bearer #{your_token_here}" }

        run_test!
      end
    end
  end
end