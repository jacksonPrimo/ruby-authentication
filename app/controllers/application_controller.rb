class ApplicationController < ActionController::API
  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    token = header.split(" ").last if header

    begin
      @decode = JsonWebToken.decode(header)
      @current_user = User.find(@decode[:user_id])
    rescue ::ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue ::JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  def render_result result
    if result[:error]
      render json: { error: result[:error] }, status: result[:code]
    else
      render json: result
    end
  end

  def params 
    request.params
  end
end
