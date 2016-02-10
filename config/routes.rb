Scrutanize::Engine.routes.draw do
  # namespace :scrutanize do
  #   get 'audit_logs', action: 'audit_logs#index'
  # end

  get '/audit_logs', to: 'audit_logs#index'
  delete '/audit_log/:id', to: 'audit_logs#destroy', as: :destroy_audit_log
  # resources :audit_logs, only: [:index], controller: 'audit_logs'
end
