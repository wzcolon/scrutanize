Scrutanize::Engine.routes.draw do
  # namespace :scrutanize do
  #   get 'audit_logs', action: 'audit_logs#index'
  # end

  get '/audit_logs', to: 'audit_logs#index'
  # resources :audit_logs, only: [:index], controller: 'audit_logs'
end
