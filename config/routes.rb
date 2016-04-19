Scrutanize::Engine.routes.draw do
  # namespace :scrutanize do
  #   get 'audit_logs', action: 'audit_logs#index'
  # end

  # get 'report/:id//all_audit_logs', to: 'audit_logs#show_all', as: :report_all_audit_logs
  # delete '/audit_log/:id', to: 'audit_logs#destroy', as: :destroy_audit_log
  # put '/restore_audit_log/:id', to: 'audit_logs#restore', as: :restore_audit_log

  # get '/audit_reports', to: 'audit_reports#index'
  # get '/audit_report/:id', to: 'audit_reports#show', as: :audit_report
  # get '/all_audit_reports', to: 'audit_reports#show_all'
  # delete '/audit_report/:id', to: 'audit_reports#destroy', as: :destroy_audit_report
  # put '/restore_audit_report/:id', to: 'audit_reports#restore', as: :restore_audit_report
  #


  resources :audit_reports, only: [:index, :show, :destroy] do
    resources :audit_logs, only: [:index]
    get 'show_all_audit_logs', to: 'audit_logs#show_all', as: :show_all_audit_logs
  end

  get :show_all_audit_reports, to: 'audit_reports#show_all'
  put 'restore_audit_report/:id', to: 'audit_reports#restore', as: :restore_audit_report

  delete 'audit_log/:id', to: 'audit_logs#destroy', as: :audit_log
  put 'audit_log/:id', to: 'audit_logs#restore', as: :restore_audit_log
end
