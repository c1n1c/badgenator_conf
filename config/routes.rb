# coding: utf-8

Badgenator::Application.routes.draw do
  root :to => 'welcome#index'

  get 'contacts' => 'welcome#contacts', :as => :contacts

  resources :badge_sets, :path => "archive" do
    resources :badges do
      get 'page/:page', :action => :index, :on => :collection
    end

    get 'page/:page', :action => :index, :on => :collection
    get 'print', :action => :print, :on => :member
  end

  unless Rails.application.config.consider_all_requests_local
    match '*not_found', :to => 'errors#error_404'
  end
end
