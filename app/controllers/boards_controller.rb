class BoardsController < ApplicationController
  def home
    @boards = Board.order(created_at: :desc).limit(10)
  end

  def index
    @boards = Board.order(created_at: :desc)
  end
  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.valid?
      @board.board_data = @board.generate_board
      if @board.board_data.present?
        @board.save
        redirect_to board_path(@board), notice: "The board game was created"
      else
        flash[:alert] = "There was an error creating the board"
        redirect_to new_board_path
      end
    else
      # flash[:notice] = "asdfsadgsgqergqeytqeryq"
      render :new, notice: "The board is not valid."
    end
  end

  private

  def board_params
    params.require(:board).permit(:email, :board_name, :width, :height, :num_mines)
  end

end
