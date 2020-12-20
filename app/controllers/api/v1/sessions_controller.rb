module Api
  module V1
    class SessionsController < BaseController
      LOGIN_TYPE_SSO = 'sso'
      LOGIN_TYPE_PASSWORD = 'password'

      before_action :find_user, only: :new

      def new
        if @user&.use_sso?
          api_respond_ok(data: { type: LOGIN_TYPE_SSO })
        else
          api_respond_ok(data: { type: LOGIN_TYPE_PASSWORD })
        end
      end

      private

      def find_user
        param = params.require(:username)
        @user = User.find_by(username: param) || User.find_by(email: param)
      end
    end
  end
end
