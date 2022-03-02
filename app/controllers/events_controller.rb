class EventsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]

  around_action :set_time_zone

  def index
    @event = Event.all.sample
    @events = Event.all
    @city = ["https://www.leparisien.fr/resizer/MSDK6Px0n3swOASvwxCmG5ChPKY=/932x582/cloudfront-eu-central-1.images.arcpublishing.com/leparisien/6ZJNUCHMVZEFFCWBOWISKV53ZI.jpg", "https://www.leparisien.fr/resizer/MSDK6Px0n3swOASvwxCmG5ChPKY=/932x582/cloudfront-eu-central-1.images.arcpublishing.com/leparisien/6ZJNUCHMVZEFFCWBOWISKV53ZI.jpg","https://www.leparisien.fr/resizer/MSDK6Px0n3swOASvwxCmG5ChPKY=/932x582/cloudfront-eu-central-1.images.arcpublishing.com/leparisien/6ZJNUCHMVZEFFCWBOWISKV53ZI.jpg","https://www.leparisien.fr/resizer/MSDK6Px0n3swOASvwxCmG5ChPKY=/932x582/cloudfront-eu-central-1.images.arcpublishing.com/leparisien/6ZJNUCHMVZEFFCWBOWISKV53ZI.jpg"]

    @avatar = ["","https://cdn-icons-png.flaticon.com/512/3135/3135715.png","https://www.immo-passion-maroc.com/wp-content/uploads/2021/06/people-profile-icon_24877-40756.jpg"]
  end

  def show 
    @event = Event.find(params[:id])

    @city = ["https://www.leparisien.fr/resizer/MSDK6Px0n3swOASvwxCmG5ChPKY=/932x582/cloudfront-eu-central-1.images.arcpublishing.com/leparisien/6ZJNUCHMVZEFFCWBOWISKV53ZI.jpg", "https://www.leparisien.fr/resizer/MSDK6Px0n3swOASvwxCmG5ChPKY=/932x582/cloudfront-eu-central-1.images.arcpublishing.com/leparisien/6ZJNUCHMVZEFFCWBOWISKV53ZI.jpg","https://www.leparisien.fr/resizer/MSDK6Px0n3swOASvwxCmG5ChPKY=/932x582/cloudfront-eu-central-1.images.arcpublishing.com/leparisien/6ZJNUCHMVZEFFCWBOWISKV53ZI.jpg","https://www.leparisien.fr/resizer/MSDK6Px0n3swOASvwxCmG5ChPKY=/932x582/cloudfront-eu-central-1.images.arcpublishing.com/leparisien/6ZJNUCHMVZEFFCWBOWISKV53ZI.jpg"]

  end


  def new
    @event = Event.new
  end

  def create

    @event = Event.new(
      'start_date' => params[:start_date],
      'duration' => params[:duration],
      'title' => params[:title],
      'description' => params[:description],
      'price' => params[:price],
      'location' => params[:location],
      'admin_id' => current_user.id)

    if @event.save
      redirect_to event_path(@event.id)
    else
      render 'new'
    end
  end


  private


  
def set_time_zone(&block)
   Time.use_zone('Europe/Paris', &block)
end

def authenticate_user
  unless current_user
    flash[:danger] = "Please log in."
    redirect_to new_user_session_path
  end
end

end
