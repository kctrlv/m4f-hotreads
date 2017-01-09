Rails.application.routes.draw do
  root 'hotreads#index'
  post 'api/v1/hotreads', to: 'hotreads#create'
end
