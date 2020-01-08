Rails.application.routes.draw do
  resources :taggings
  resources :tags
  resources :comments
  resources :users
  resources :posts

  post "/newpost", to: 'posts#create_new_post'
  post "/newcomment", to: 'comments#create_new_comment'
  post "/newuser", to: 'users#create_new_user'
  get "viewonepost", to: 'posts#view_one_post'
  get "viewoneuser", to: 'users#view_one_user'
  post "followuser", to: 'user#follow_user'
  post "unfollowuser", to: 'user#unfollow_user'
  get "all_followers", to: 'user#all_followers'
  get "all_followed_users", to: 'user#all_followed_users'
  get "searchposts", to: 'search#search_post'



end
