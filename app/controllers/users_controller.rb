class UsersController < ApplicationController

  def index

      matching_users = User.all
      @list_of_users = matching_users.order({ :username => :asc})

  #@list_of_users = ...

  render({ :template => "user_templates/index.html.erb"})
  end


end
