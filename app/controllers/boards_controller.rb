class BoardsController < ApplicationController
  def create
    board = Board.new(board_params)

    if board.save
      render json: board, include: [:user]
    else
      render json: { error_messages: board.errors.full_messages }
    end
  end

  def index
    boards = Board.all

    if boards
      render json: boards, include: [:user]
    else
      render json: { message: 'Boards not found' }
    end
  end

  def show
    board = Board.find(params[:id])

    if board
      render json: board, include: [:user]
    end

  rescue ActiveRecord::RecordNotFound
    render json: { error_messages: "Board not found." }
  end

  def update
    board = Board.find(params[:id])

    if board.update(board_params)
      render json: board, include: [:user]
    else
      render json: { error_messages: board.errors.full_messages }
    end
  end

  def destroy
    board = Board.find(params[:id])

    if board.destroy
      render json: { message: 'Board deleted' }
    else
      render json: { error_messages: board.errors.full_messages }
    end
  end

  private

  def board_params
    @board_params ||=  params.require(:board).permit(
      :user_id,
      :name,
      :length,
      :volume,
    )
  end
end
