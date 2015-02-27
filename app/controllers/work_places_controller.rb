class WorkPlacesController < ApplicationController
  before_action :authenticated
  before_action :set_work_place, only: [:edit, :update]

  # GET /work_places/new
  def new
    if current_user.work_place
      redirect_to work_places_edit_path
    else
      @work_place = WorkPlace.new
    end
  end

  # GET /work_places/edit
  def edit
    redirect_to work_places_new_path unless current_user.work_place
  end

  # POST /work_places
  def create
    @work_place = WorkPlace.new(new_work_place)

    respond_to do |format|
      if @work_place.save
        format.html { redirect_to root_path, notice: 'WorkPlace was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT PATCH /work_places
  def update
    respond_to do |format|
      if @work_place.update(work_place_params)
        format.html { redirect_to root_path, notice: 'WorkPlace was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  private

  def set_work_place
    @work_place = WorkPlace.find_by(user_id: current_user.id)
  end

  def work_place_params
    params.require(:work_place).permit(:user_id, :destination, :hour, :min)
  end

  def new_work_place
    work_place_params.merge({ user_id: current_user.id })
  end
end
