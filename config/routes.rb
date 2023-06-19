Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      scope :auth do
        post 'signup' => 'auth#signup'
        post 'signin' => 'auth#signin'
      end
    end
  end
end
