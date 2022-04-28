Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace 'api' do
    get '/returns', to: 'returns#client_returns'
    resources :clients do
      resources :returns do 
      end
    end
  end

end
