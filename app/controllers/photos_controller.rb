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
end
