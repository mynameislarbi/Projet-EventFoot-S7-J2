class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show, :edit,:update]

  def show
    @user = User.find(params[:id])
    @events = Event.all
    @city = ["https://abylon-conseil.com/wp-content/uploads/2020/03/Smart-city1.png", "https://www.veolia.com/sites/g/files/dvc4206/files/styles/content_push_teaser/public/image/2020/10/Nouvelle%20Orl%C3%A9ans%20GettyImages-CP.jpg?itok=Cg_XCU0A","https://siecledigital.fr/wp-content/uploads/2021/02/1920_20200107-01-011-2-300x230.jpg","https://www.techno-science.net/illustration/Definition/300px/Moscow-City-28-03-2010-2.jpg"]

    @avatar = ["https://cdn-icons-png.flaticon.com/512/206/206853.png","https://cdn-icons-png.flaticon.com/512/3135/3135715.png","https://www.immo-passion-maroc.com/wp-content/uploads/2021/06/people-profile-icon_24877-40756.jpg"]
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    params.require(:user).permit(:first_name,:last_name, :description).inspect
  
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end


  private 

  def user_params
    user_params = params.require(:user).permit(:first_name,:last_name, :description)
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_user_session_path
    end
  end

end
