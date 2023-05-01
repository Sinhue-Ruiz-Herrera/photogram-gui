class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })

    #@list_of_users = ...

    render({ :template => "user_templates/index.html.erb" })
  end

  def show
    # Parameters: {"path_username"=>"ygjvgvj"

    url_username = params.fetch("path_username")
    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.at(0)

    render({ :template => "user_templates/show.html.erb" })
  end

  def add_user
    #Parameters: {"input_username"=>"rene"}

    input_user = params.fetch("input_username")

    a_new_username = User.new
    a_new_username.username = input_user

    a_new_username.save

    next_url = "/users/" + a_new_username.to_s
    redirect_to(next_url)

    #render({ :template => "user_templates/add_user.html.erb"})
  end

    def modify_user
      #Parameters: {"input_username"=>"rigoberta"}
      
      user_name = params.fetch("input_old_username")

      matching_username = User.where({ :username => user_name})

      the_user = matching_username.at(0)

     

      input_user = params.fetch("input_new_username")
      the_user.username = input_user
      #the_photo.caption = input_caption
      
      the_user.save

      redirect_to "/users/" + the_user.username
    end
  
end
