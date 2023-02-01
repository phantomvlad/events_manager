module Api
  module V1
    class ApiController < ActionController::Base
      skip_before_action :verify_authenticity_token
      before_action :set_json_format

      private

      def set_json_format
        request.format = :json
      end

      def current_user
        User.last
      end

      def respond_with_errors(object)
        render json: object.errors.to_hash, status: 400
      end
    end
  end
end
