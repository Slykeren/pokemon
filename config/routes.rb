Rails.application.routes.draw do
  get 'about', to: 'static_pages#about', as: 'about'

  def move_params
    params.require(:move).permit(:name, :search)
  end

  resources :pokeman
  resources :moves
  resources :items
  resources :pokemon_moves
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
