Rails.application.routes.draw do
  namespace :admin do
    resources :gigs
    resources :seasons
    resources :musicians
    resources :instruments
    resources :venues
    resources :pricing_tiers
    resources :page_contents
    resources :newsletter_subscribers

    root to: 'gigs#index'
  end

  get 'newsletter_subscribers_dump', to: 'newsletter_subscriber_dump#index'
  root 'home#index'
  resources :gigs
  resources :seasons
  resources :newsletter

  get 'current-season', to: 'seasons#show', as: :current_season
  get 'next-season', to: 'seasons#show', as: :next_season
  get 'current-venue', to: 'venues#show', as: :current_venue
  get 'club-history', to: 'history#show', as: :club_history
  get 'hertforshire-venues', to: 'herts_venues#index', as: :herts_venues
  get 'covid19-protocols', to: 'pages#covid_protocols'
end
