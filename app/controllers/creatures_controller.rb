class CreaturesController < ApplicationController
	# display all creatures
  def index
    # get all creatures from db and save to instance variable
    @creatures = Creature.all
    # render the index view (it has access to instance variable)
    # remember the default behavior is to render :index
  end
  # show the new creature form
  def new
    # remember the default behavior is to render :new
  end
  # create a new creature in the database
  def create
    # whitelist params and save them to a variable
    creature_params = params.require(:creature).permit(:name, :description)
    creature = Creature.new(creature_params)

    # if creature saves, redirect to route that displays all creatures
    if creature.save
      redirect_to creatures_path
      # redirect_to creatures_path is equivalent to:
      # redirect_to "/creatures"
    end
  end
  # show the new creature form
  def new
    @creature = Creature.new
    # remember the default behavior is to render :new
  end
  # display a specific creature
  def show
    # get the creature id from the url params
    creature_id = params[:id]

    # use `creature_id` to find the creature in the database
    # and save it to an instance variable
    @creature = Creature.find_by_id(creature_id)

    # render the show view (it has access to instance variable)
    # remember the default behavior is to render :show
  end
  # show the edit creature form
  def edit
    # get the creature id from the url params
      creature_id = params[:id]
    # use `creature_id` to find the creature in the database
      # and save it to an instance variable
      @creature = Creature.find_by_id(creature_id)
    # render the edit view (it has access to instance variable)
  end

  # update a creature in the database
  def update
    #  get the creature id from the url params
     creature_id = params[:id]
    # use `creature_id` to find the creature in the database and save to variable
     creature = Creature.find_by_id(creature_id)
    # whitelist params 
    creature_params = params.require(:creature).permit(:name, :description)
    # update the creature based on params
     creature.update_attributes(creature_params)
    # redirect to show page for the updated creature
    redirect_to creature_path(creature)
    # redirect_to creature_path(creature) is equivalent to:
    # redirect_to "/creatures/#{creature.id}"
  end

end
