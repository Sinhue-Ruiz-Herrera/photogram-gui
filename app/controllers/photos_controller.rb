class PhotosController < ApplicationController
  def index

    #photo_id = params.fetch("path_id")
    photos = Photo.all
    @list_of_photos = photos.order({ :created_at => :desc })

    #@photo_list = photos.where({ :id => :photo_id}).at(0)
    render({ :template => "photos_templates/photo_index.html.erb" })
  end

  def show
    url_username = params.fetch("path_username")
    matching_usernames = Photo.where({ :id => url_username })

    @the_user = matching_usernames.at(0)
    render({ :template => "photos_templates/photos_details.html.erb" })
  end
end
