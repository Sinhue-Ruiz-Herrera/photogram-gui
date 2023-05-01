Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index"})

  get("/users", { :controller => "users", :action => "index"})
  get("/users/:path_username", { :controller => "users", :action => "show"})

  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:path_photo_id", { :controller => "photos", :action => "show"})

  get("/delete_photo/:borrar_id", { :controller => "photos", :action => "borrar"})
  get("/insert_photo", { :controller => "photos", :action => "agregar"})
  get("/update_photo/:modify_id", { :controller => "photos", :action => "editar"})

  get("/insert_comment_record", { :controller => "photos", :action => "add_comment"})

  get("/insert_user_record",{ :controller => "users", :action => "add_user"})
  get("/update_user", { :controller => "users", :action => "modify_user"})

end
