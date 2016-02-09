Rails.application.routes.draw do
  root to: 'contracts#index'
  mount Scrutanize::Engine => "/scrutanize"
end
