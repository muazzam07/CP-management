Rails.application.routes.draw do
  root      'users#index'
  get       'userpage'     =>  'users#userpage'
  get       'login'        =>  'sessions#new'
  post      'login'        =>  'sessions#create'
  delete    'logout'       =>  'sessions#destroy'
  
  get       'users/course/new', :to => 'course#new'
  put       'users/course/courseadd', :to => 'course#courseadd'
  get       'users/course/managecourse', :to => 'course#managecourse'
  put       'users/course/coursepage', :to => 'course#coursepage'
  get       'users/course/delcourse', :to => 'course#delcourse'
  get       'users/course/seatingplan', :to => 'course#seatingplan'
  get       'users/course/seatingplanadd', :to => 'course#seatingplanadd'
  get       'users/course/manageseatingplan', :to => 'course#manageseatingplan'
  get       'users/course/editseatingplan', :to => 'course#editseatingplan'
  put       'users/course/editcomplete', :to => 'course#editcomplete'
  get       'users/course/delseatingplan', :to => 'course#delseatingplan'
  get       'users/course/markclass', :to => 'course#markclass'
  put       'users/course/markcomplete', :to => 'course#markcomplete'
  
  
  #get    'manageCourse' => 'users#manageCourse'
  #get    'editcourse'   => 'users#editcourse'
  #et    'seatingplan'  => 'users#seatingplan'
  #post   'addseatingplan' => 'users#addseatingplan'
  #put    'coursePage'   => 'users#coursePage'
  #get    'delCourse'    => 'users#delCourse'
  #get    'newclass'     => 'users#newclass'
  #put    'classadded'   => 'users#classadded'
  #get    'markclass'    => 'users#markclass'
  #get    'managemarks'  => 'users#managemarks'
  #get    'editmarks'    => 'users#editmarks'
  #post   'editcomplete' => 'users#editcomplete'
  #get    'viewmarks'    => 'users#viewmarks'
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end