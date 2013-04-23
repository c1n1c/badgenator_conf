Badgenator::Application.routes.draw do
  root :to => 'welcome#index'

  get 'contacts' => 'welcome#contacts', :as => :contacts

  resources :badge_sets, :path => "archive" do
    resources :badges do
      get 'page/:page', :action => :index, :on => :collection
    end
    
    get 'page/:page', :action => :index, :on => :collection
  end
end
