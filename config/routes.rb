Rails.application.routes.draw do

  get("/users", { :controller => "users", :action => "index"})
  get("/users/:path_username", { :controller => "users", :action => "show"})

  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:path_photo_id", { :controller => "photos", :action => "show"})

  get("/delete_photo/:borrar_id", { :controller => "photos", :action => "borrar"})
  get("/insert_photo", { :controller => "photos", :action => "agregar"})

  

end
