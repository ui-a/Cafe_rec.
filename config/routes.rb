Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

devise_scope :user do
  post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
end

  root to: 'public/homes#top'

  scope module: :public do
    get 'about' => 'homes#about', as: 'about'
    get 'privacy_policy' => 'homes#privacy_policy', as: 'privacy_policy'
    resources :records, only: [:index]
    resources :record_tea_leaves, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :record_coffees, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :searches, only: [:index] do
      collection do
        get :search
      end
    end

    get 'users/mypage' => 'users#index'
    get 'users/setting/edit' => 'users#edit'
    patch 'users/setting' => 'users#update'
    get 'users/confirm' => 'users#confirm'
    patch 'users/withdraw' => 'users#withdraw'
    get 'users/:id' => 'users#show', as: 'users/record'
    get 'favorites_coffee' => 'favorites#coffee_list'
    get 'favorites_tea' => 'favorites#tea_list'
    get 'search_coffeetags' => 'record_coffees#search'
    get 'search_teatags' => 'record_tea_leaves#search'
  end

  namespace :admin do
    get '/' => 'homes#top'
    get 'search_coffeetags' => 'record_coffees#search'
    get 'search_teatags' => 'record_tea_leaves#search'
    get 'search' => 'searches#search'
    resources :users, only: [:index, :show, :edit, :update]
    resources :record_coffees, only: [:index, :show, :edit, :update, :destroy]
    resources :record_tea_leaves, only: [:index, :show, :edit, :update, :destroy]
    resources :tags, only: [:index, :edit, :update]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
