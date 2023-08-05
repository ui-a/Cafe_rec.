Rails.application.routes.draw do
  root to: 'public/homes#top'

  scope module: :public do
    get 'about' => 'homes#about', as: 'about'
    get 'favorites/index'
    get 'users/index'
    get 'records/index'
    resources :record_tea_leaves, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :record_coffees, only: [:show, :new, :create, :edit, :update, :destroy]
  end

  namespace :admin do
    get '/' => 'homes#top'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end

  namespace :admin do
    get 'tag/index'
    get 'tag/edit'
  end
  namespace :admin do
    get 'record_tea_leaves/show'
    get 'record_tea_leaves/edit'
    get 'record_tea_leaves/new'
  end
  namespace :admin do
    get 'record_coffees/show'
    get 'record_coffees/edit'
    get 'record_coffees/new'
  end
  namespace :admin do
    get 'records/index'
  end


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

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
