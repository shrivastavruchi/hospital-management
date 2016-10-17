Rails.application.routes.draw do
  resources :rooms  
  resources :beds
  resources :diagnoses
  resources :departments
  resources :department_doctors
  resources :patients do  
  end  
  get 'visit/:id/prescription_detail' => 'visits#prescription_detail', :as=>"prescription_details"
  get '/opd_visit' => 'visits#opd_visit', :as=>"opd_visits"
 
  get '/dashboard'  => 'visits#dashboard', :as=>"dashboard"
  get '/billing'  => 'visits#billing', :as=>"billing"
  get '/paid_bill'  => 'visits#paid_bill', :as=>"paid_bill"
  get '/visit/:visit_id/report_genrate' => 'reports#genrate_report', :as=>"genrate_report" 
  get '/visit/:visit_id/print_receipt' => 'diagnoses#print_receipt', :as=>"print_receipt"  
  
  post '/download_paid_bill'  => 'reports#download_paid_bill', :as=>"downlaod_paid_bill"

  resources :services do 
    
  end   
 


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

  resources :discharges
  resources :visits do
    resources :discharges, only: [:new, :create] do
    end  
  end 

  resources :visits do
    resources :visit_rooms, only: [:new, :create,:index,:destroy] do
    end  
  end 

  resources :visits do 
    resources :operation_theaters,  only: [:new,:create,:index,:show] do
    end
  end    





  get '/ipd_visits' => 'visits#ipd_visits', :as=>"ipd_visits"
  get '/visit/:id/basic_detail' => 'visits#basic_detail', :as=>"basic_detail"
#-------------------------------------------------------

 
  devise_for :users
  resources :user
  
  resources :visits do
    get 'all_services' 
    get 'report'
    get 'genrate_bill'
  end  

  get 'visit/:visit_id/payment/new' => 'payments#new', :as=>"payment_new"
  post 'visit/:visit_id/payments' => 'payments#create', :as=>"create_payment"
  post 'visit/:visit_id/payment' => 'payments#payment', :as=>"payment"
  get '/report' => 'reports#index', :as=>"report"




  #--------------------------------
    
  post  '/search_category_room' => 'visits#search_category_room',:as=>"search_category_room"
  post '/search_visit'  => 'visits#search_visits', :as=>"search_visits"


  get '/bed/:bed_id/admit' => 'beds#admit',:as=>"admit"
  get '/country/:country_id/states' => 'patients#states',:as=>"states"
  get '/state/:state_id/cities' => 'patients#cities',:as=>"cities" 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'user#index'

  resources :visits do
    resources :visit_services do 
    end
  end  

  resources :medicines do 
  end  
  get '/export' => 'medicines#export',:as=>"export"
  

#----------------------
resources :categories


#------------------------
#bill part







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
