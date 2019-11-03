Rails.application.routes.draw do
  devise_for :coaches
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :coach do
    unauthenticated :coach do
      root to: 'devise/sessions#new'
    end

    authenticated :coach do
      get '/', to: redirect('/clients')
      resources :clients
      resources :events
    end
  end
end
