Rails.application.routes.draw do
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Pathに対し言語設定が含まれるようにする
  scope "/:locale" do
    resources :books
  end
end

