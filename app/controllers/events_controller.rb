class EventsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]

  around_action :set_time_zone

  def index
    @event = Event.all.sample
    @events = Event.all
    @city = ["https://abylon-conseil.com/wp-content/uploads/2020/03/Smart-city1.png", "https://www.veolia.com/sites/g/files/dvc4206/files/styles/content_push_teaser/public/image/2020/10/Nouvelle%20Orl%C3%A9ans%20GettyImages-CP.jpg?itok=Cg_XCU0A","https://siecledigital.fr/wp-content/uploads/2021/02/1920_20200107-01-011-2-300x230.jpg","https://www.techno-science.net/illustration/Definition/300px/Moscow-City-28-03-2010-2.jpg"]

    @avatar = ["https://cdn-icons-png.flaticon.com/512/206/206853.png","https://cdn-icons-png.flaticon.com/512/3135/3135715.png","https://www.immo-passion-maroc.com/wp-content/uploads/2021/06/people-profile-icon_24877-40756.jpg"]
  end

  def show 
    @event = Event.find(params[:id])

    @city = ["https://abylon-conseil.com/wp-content/uploads/2020/03/Smart-city1.png", "https://www.veolia.com/sites/g/files/dvc4206/files/styles/content_push_teaser/public/image/2020/10/Nouvelle%20Orl%C3%A9ans%20GettyImages-CP.jpg?itok=Cg_XCU0A","https://siecledigital.fr/wp-content/uploads/2021/02/1920_20200107-01-011-2-300x230.jpg","https://www.techno-science.net/illustration/Definition/300px/Moscow-City-28-03-2010-2.jpg"]

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
