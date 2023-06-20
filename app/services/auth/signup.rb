module Services
  module Auth
    class Signup < Base
      def initialize(params)
        @params = params
      end

      def call
        already_has_user_with_this_email?
        create_user
      rescue ServiceException => e
        { error: e.message, code: e.code }
      rescue Exception => e
        { error: e.message, code: 500 }
      end

      def already_has_user_with_this_email?
        user = User.find_by_email(@params[:email])
        raise ServiceException.new('email already in use', 400) if user 
      end

      def create_user
        user = User.new(sanitize_params)
        return user if user.save!
        raise ServiceException.new("cannot register user: #{user.errors}", 400)
      end

      def sanitize_params
        {
          name: @params[:name],
          password:  @params[:password],
          email:  @params[:email]
        }
      end
    end
  end
end