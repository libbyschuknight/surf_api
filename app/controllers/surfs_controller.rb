class SurfsController < ApplicationController
  def create
    surf = Surf.new(surf_params)

    if surf.save
      render json: surf, include: [:user, :location, :board]
    else
      render json: { error_messages: surf.errors.full_messages }
    end
  end

  def index
    surfs = Surf.all

    if surfs
      render json: surfs, include: [:user, :location, :board]
    else
      render json: { error_messages: "No surfs." }
    end
  end

  def show
    surf = Surf.find(params[:id])

    if surf
      render json: surf, include: [:user, :location, :board]
    end

  rescue ActiveRecord::RecordNotFound
    render json: { error_messages: "Surf not found." }
  end

  def update
    surf = Surf.find(params[:id])

    if surf.update(surf_params)
      render json: surf, include: [:user, :location, :board]
    else
      render json: { error_messages: surf.errors.full_messages }
    end
  end

  def destroy
    surf = Surf.find(params[:id])

    if surf.destroy
      render json: { message: 'Surf deleted' }
    else
      render json: { error_messages: surf.errors.full_messages }
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
