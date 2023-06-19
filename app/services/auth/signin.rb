require "json_web_token"

module Services
  module Auth
    class Signin < Base
      def call
        find_user
        authenticate
      end

      def find_user
        @user = User.find_by_email(@params[:email])
      end

      def authenticate 
        if @user&.authenticate(@params[:password])
          token = JsonWebToken.encode(user_id: @user.id)
          time = Time.now + 24.hours.to_i

          { 
            token: token, 
            exp: time.strftime("%m-%d-%Y %H:%M"),
            username: @user.name 
          }
        else
          { 
            error: 'unauthorized',
            description: 'cannot signin with this credentials'
          }
        end
      end
    end
  end
end