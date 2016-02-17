Scrutanize::Engine.routes.draw do
  # namespace :scrutanize do
  #   get 'audit_logs', action: 'audit_logs#index'
  # end

  get '/audit_logs', to: 'audit_logs#index'
  get '/all_audit_logs', to: 'audit_logs#show_all'
  delete '/audit_log/:id', to: 'audit_logs#destroy', as: :destroy_audit_log
  put '/restore_audit_log/:id', to: 'audit_logs#restore', as: :restore_audit_log
end
