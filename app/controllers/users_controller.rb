class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show, :edit,:update]

  def show
    @user = User.find(params[:id])
    @events = Event.all
    @city = ["https://www.leparisien.fr/resizer/MSDK6Px0n3swOASvwxCmG5ChPKY=/932x582/cloudfront-eu-central-1.images.arcpublishing.com/leparisien/6ZJNUCHMVZEFFCWBOWISKV53ZI.jpg", "https://www.leparisien.fr/resizer/MSDK6Px0n3swOASvwxCmG5ChPKY=/932x582/cloudfront-eu-central-1.images.arcpublishing.com/leparisien/6ZJNUCHMVZEFFCWBOWISKV53ZI.jpg","https://www.leparisien.fr/resizer/MSDK6Px0n3swOASvwxCmG5ChPKY=/932x582/cloudfront-eu-central-1.images.arcpublishing.com/leparisien/6ZJNUCHMVZEFFCWBOWISKV53ZI.jpg","https://www.leparisien.fr/resizer/MSDK6Px0n3swOASvwxCmG5ChPKY=/932x582/cloudfront-eu-central-1.images.arcpublishing.com/leparisien/6ZJNUCHMVZEFFCWBOWISKV53ZI.jpg"]

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
