Mojoku::Application.routes.draw do
  get "email_confirmations/create"

  get "email_confirmations/verify"

  get "email_confirmations/new"

  get "relationships/create"


  resources :album_images

  resources :albums

  get "member/home"

  get "member/profile"

  get "member/editprofile"
  
  get "member/edit_profile_pic"
  
  get "member/edit_email"

  post "member/send_confirmation"

  get "member/resend_confirmation"
  
  post "member/resend_confirmation"

  get "member/cancel_confirmation_request"

  post "member/cancel_confirmation_request"
  
  get "member/edit_password"
 
  get "member/edit_personal_details"

  get "member/edit_contact_info"
    
  get "member/edit_role"
    
  put "member/updateprofile"
    
  put "member/updaterole"

  
  get "member/portfolio"

 get "member/new_album"

get "member/show_album"

get "member/show_album_image"

  get "member/edit_album_info"

  match "member/update_album_info"

get "member/add_images"

get "member/edit_images"

put "member/update_images"

put "member/save_images"
post "member/save_images"

 post "member/create_album"

 put 'member/update_profile_pic'

 get 'member/show_relationships'

  get "public/home"

  get "public/list_members"

  get "public/member_home"
  
  get "public/member_profile"
  
  get "public/member_portfolio"



  devise_for :admins

  devise_for :members,  :controllers => { :registrations => "members/registrations", :sessions => "members/sessions" }

  #get "/members/resend_confirmation" , :controller => :sessions, :action => 'resend_confirmation'

  match "/members/registered" => 'members/registrations#show'
  match "/members/resend_confirmation" => 'members/sessions#resend_confirmation'
  #:controller => :registrations, :action => 'registered'
  match 'email_confirmations/resend_first_confirmation'
  resources :modeling_agents

  resources :photographers

  resources :models





  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => "public#home"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
