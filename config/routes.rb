Rails.application.routes.draw do

  # Routes for the Bid resource:

  # CREATE
  post("/add_bid/:path_id", { :controller => "bids", :action => "create" })
          
  # READ
  get("/bids", { :controller => "bids", :action => "index" })
  
  get("/bids/:path_id", { :controller => "bids", :action => "show" })
  
  # UPDATE
  
  post("/modify_bid/:path_id", { :controller => "bids", :action => "update" })
  
  # DELETE
  get("/delete_bid/:path_id", { :controller => "bids", :action => "destroy" })

  #------------------------------

  get("/", {:controller=> "application", :action=>"homepage"})
  
  # Routes for the Interest resource:

  # CREATE
  post("/insert_interest", { :controller => "interests", :action => "create" })
          
  # READ
  get("/interests", { :controller => "interests", :action => "index" })
  
  get("/interests/:path_id", { :controller => "interests", :action => "show" })
  
  # UPDATE
  
  post("/modify_interest/:path_id", { :controller => "interests", :action => "update" })
  
  # DELETE
  get("/delete_interest/:path_id", { :controller => "interests", :action => "destroy" })

  #------------------------------

  # Routes for the Listing resource:

  # CREATE
  post("/insert_listing", { :controller => "listings", :action => "create" })
          
  # READ
  get("/listings", { :controller => "listings", :action => "index" })
  
  get("/listings/:path_id", { :controller => "listings", :action => "show" })
  
  # UPDATE
  
  post("/modify_listing/:path_id", { :controller => "listings", :action => "update" })
  
  # DELETE
  get("/delete_listing/:path_id", { :controller => "listings", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # ------------------------------

end
