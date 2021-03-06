require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :taggings
  resources :tags
  resources :comments
  resources :users
  resources :posts

  post "/newcomment", to: 'comments#create_new_comment'
  post "/newuser", to: 'users#create_new_user'
  get "viewoneuser", to: 'users#view_one_user'
  post "followuser", to: 'user#follow_user'
  post "unfollowuser", to: 'user#unfollow_user'
  get "all_followers", to: 'user#all_followers'
  get "all_followed_users", to: 'user#all_followed_users'
  post "searchposts", to: 'posts#search_posts_by_tags'
  get "searchtagsbylocation", to: 'posts#search_posts_by_location'
  get "getUsersPosts/:id", to: 'posts#view_one_users_posts'
  post '/set_current_user', to: 'users#login_current_user'



end
