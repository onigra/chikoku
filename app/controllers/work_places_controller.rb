class WorkPlacesController < ApplicationController
  before_action :set_work_place, only: [:edit, :update]

  def new
    @work_place = WorkPlace.new
  end

  def edit
  end

  def create
    @work_place = WorkPlace.new(new_work_place)

    respond_to do |format|
      if @work_place.save
        format.html { redirect_to root_path, notice: 'WorkPlace was successfully created.' }
        format.json { render json: @work_place, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @work_place.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @work_place.update(work_place_params)
        format.html { redirect_to root_path, notice: 'WorkPlace was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @work_place.errors, status: :unprocessable_entity }
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
