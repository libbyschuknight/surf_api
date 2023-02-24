class SurfsController < ApplicationController
  def create
    surf = Surf.new(surf_params)

    if surf.save!
      render json: surf, include: [:user, :location, :board]
    else
      # how to pass error messages through from validations?
      # like if there is no user
      # also don't think the below message is actually showing
      # getting ugly <ActiveRecord::RecordInvalid: Validation failed: User must exist> error with lots of guff
      render json: { message: 'Surf not created' }
    end
  end

  def index
    # what do I want to use to return it in JSON format?
    # - use serilizer ? blueprinter - why / why not?

    surfs = Surf.all

    if surfs
      render json: surfs, include: [:user, :location, :board]
    else
      render json: { message: 'Surfs not found' }
    end
  end

  def show
    surf = Surf.find(params[:id])

    if surf
      render json: surf, include: [:user, :location, :board]
    else
      render json: { message: 'Surf not found' }
    end
  end

  def update
    surf = Surf.find(params[:id])

    if surf.update(surf_params)
      render json: surf, include: [:user, :location, :board]
    else
      render json: { message: 'Surf not updated' }
    end
  end

  def destroy
    surf = Surf.find(params[:id])

    if surf.destroy
      render json: { message: 'Surf deleted' }
    else
      render json: { message: 'Surf not deleted' }
    end
  end

  private

  def surf_params
    @surf_params ||=  params.require(:surf).permit(
      :date,
      :notes,
      :surfed,
      :rating,
      :user_id,
      :location_id,
      :board_id
    )
  end
end
