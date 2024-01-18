Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}
  devise_scope :user do
    delete 'delete_account/:id', to: 'users/registrations#delete_account', as: 'delete_account_user'
    delete 'users/sign_out', to: 'users/sessions#destroy'
    get 'check_email', to: 'users/sessions#check_email', as: 'check_email'
  end
  
  resources :forum_threads do
    get '/:forum_category_id', to: 'forum_threads#index'
    resources :forum_posts, module: :forum_threads do
      resources :comments
    end
    resources :comments
  end

  resources :chat_bots

  get 'users_table', to: 'all_users#index', as: 'all_users'
  post 'users_table/change_role', to: 'all_users#change_role', as: 'change_role'
  get 'logs', to: 'logs#index', as: 'logs'


  # resources :users do
  #   collection do
  #     post :import
  #   end
  # end

  root to: "forum_threads#index"
end