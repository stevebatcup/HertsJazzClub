Rails.application.routes.draw do
  namespace :admin do
    resources :gigs
    resources :seasons
    resources :musicians
    resources :instruments
    resources :venues

    root to: "gigs#index"
  end

  root 'home#index'
  resources :gigs
  resources :seasons
  resources :newsletter

  get 'current-season', to: 'seasons#show', as: :current_season
  get 'current-venue', to: 'venues#show', as: :current_venue
  get 'club-history', to: 'history#show', as: :club_history
  get 'hertforshire-venues', to: 'herts_venues#index', as: :herts_venues
  # get 'current-season', to: 'seasons#show', as: :current_season
end
