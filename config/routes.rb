Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#easypost'
  get 'about', to: 'welcome#about'
  get 'ordertee', to: 'pages#order'
  get 'trackertee', to: 'pages#tracker'
  post 'pages', to: 'pages#pages'
end
