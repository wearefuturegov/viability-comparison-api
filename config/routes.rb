Rails.application.routes.draw do
  resources :viability_appraisals, only: [:show, :index]
end
