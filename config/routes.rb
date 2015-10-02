Stagebeheer::Application.routes.draw do
  resources :companies
  root :to => redirect('/companies')
  get '/companies/sort/:sortarg', to: 'companies#index'

end
