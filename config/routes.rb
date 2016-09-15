Rails.application.routes.draw do
  resources :diagnoses
  resources :departments
  resources :department_doctors
  resources :patients do  
  end  
  get 'visit/:id/prescription_detail' => 'visits#prescription_detail', :as=>"prescription_details"
  get  'visit/:id/services' => 'visits#services', :as=>"visit_services"
  get '/opd_visit' => 'visits#opd_visit', :as=>"opd_visits"
  
  resources :patient do  
     resources :appointments,only: [:new, :create,:edit,:update] do
      #get 'prescription_detail' 
    end
  end 

  resources :appointments

  # resources :appointments do 
  #    resources :visits do
  #     #get 'prescription_detail' 
  #   end
  # end 


  resources :patients do 
     resources :visits do
      #get 'prescription_detail' 
    end
  end 

  resources :visits do 
    resources :prescription_details,only: [:index, :new, :create,:destroy] do
    end  
  end  

  resources :visits do
    resources :diagnoses do
    end  
  end 


  resources :visits do
    resources :notes do
    end 
  end 

  resources :visits do
    resources :worksheet_details do
    end  
  end 

  get '/ipd_visits' => 'visits#ipd_visits', :as=>"ipd_visits"
  get '/visit/:id/basic_detail' => 'visits#basic_detail', :as=>"basic_detail"

#-------------------------------------------------

  resources :patients do
    resources :addmissions do
    end  
  end

  # resources :addmissions do
  #   resources :notes do
  #   end  
  #   get 'basic_information'
  # end 

  # resources :addmissions do
  #   resources :worksheet_details do
  #   end  
  # end 


  resources :addmissions do
    resources :prescription_details do
    end
  end    



 
  devise_for :users
  resources :user
  resources :visits do
   get 'genrate_bill'   
  end  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'user#index'

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
