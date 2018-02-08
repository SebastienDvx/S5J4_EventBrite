class EventsController < ApplicationController

def index
  @events = Event.all
end

  def new
      @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creator = current_user

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

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Event mis à jour"
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :place)
  end

end
