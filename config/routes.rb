Stagebeheer::Application.routes.draw do
  resources :companies
  root :to => redirect('/companies')
end
