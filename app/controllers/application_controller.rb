class ApplicationController < ActionController::API
    include Pundit::Authorization

    before_action :authoraze_request

    attr_reader :current_user


    private

    def authoraze_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        decoded = JsonWebToken.decode(header)
        @current_user = User.find(decoded[:user_id]) if decoded
    rescue Active::RecordNotFound, JWT::DecodeError
        render json: {errors: 'Unauthorized'}, status: :unauthorized
    end

end
