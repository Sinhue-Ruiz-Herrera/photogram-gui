class PhotosController < ApplicationController
  def index

    #photo_id = params.fetch("path_id")
    photos = Photo.all
    @list_of_photos = photos.order({ :created_at => :desc })

    #@photo_list = photos.where({ :id => :photo_id}).at(0)
    render({ :template => "photos_templates/photo_index.html.erb" })
  end

  def show
    photo_id = params.fetch("path_photo_id")
    matching_photos = Photo.where({ :id => photo_id })

    @the_photo = matching_photos.at(0)

    render({ :template => "photos_templates/photos_details.html.erb" })
  end

  def borrar
    #Parameters: {"borrar_id => "635"}
    the_id = params.fetch("borrar_id")
    matching_photos = Photo.where({ :id => the_id})
    the_photo = matching_photos.at(0)

    the_photo.destroy


    redirect_to("/photos")

  end  

    def agregar
  # Parameters: {"query_image"=>"", "query_caption"=>"", "query_owner_id"=>""}

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_image
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    redirect_to("/photos/" + a_new_photo.id.to_s)

      #render({ :template => "photos_templates/agregar.html.erb"} )
    end
end
