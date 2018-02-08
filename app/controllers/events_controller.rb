class EventsController < ApplicationController

def index
  @events = Event.all
end

  def new
    if logged_in?
      @event = Event.new
    else
      flash[:warning] = "Veuillez vous inscrire / connecter pour créer un Event."
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Evenement créé avec succès ! "
       redirect_to @event
    else
      flash.now[:danger] = "Veuillez complèter tous les champs"
       render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :place)
  end

end
