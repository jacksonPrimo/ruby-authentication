class AuthController < ApplicationController
  def signin
    result = ::Services::Auth::Signin.call(params)
    render_result result
  end
  
  def signup
    result = ::Services::Auth::Signup.call(params)
    render_result result
  end
end
