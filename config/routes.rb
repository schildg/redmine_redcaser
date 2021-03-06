# frozen_string_literal: true

get '/projects/:project_id/redcaser/testcases/:id', :to => "redcaser/testcases#show", via: :get

resources :projects do
  member do
    get :redcaser, to: 'redcaser#index'
    get 'redcaser/attachment_urls', to: 'redcaser#attachment_urls'
  end

  namespace :redcaser do
    resources :environments
    resources :testsuites, except: [:show]

    resources :testcases,        only: [:show, :update, :destroy]
    resources :testcasestatuses, only: [:create, :update]

    resources :executionsuites

    resources :querytestcases, only: :show

    resources :executionjournals, only: :index
  end
end
