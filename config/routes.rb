Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'short_url', to: 'urls#short_url'

  get '/:short_url', to: 'urls#redirect_to_original'
end
