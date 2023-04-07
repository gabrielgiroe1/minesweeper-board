class Board < ApplicationRecord
  validates :width, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :height, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :num_mines, presence: true, numericality: { only_integer: true, greater_than: 0,less_than_or_equal_to: :max_mines }
  validates :board_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :generate_board, presence: true


  def max_mines
    width * height
  end

  def random_bomb
    @random_b=Array.new(width*height,0)
    (0..num_mines).each do |i|
      @random_b[i] = 1
    end
    @random_b.shuffle!
  end
  def generate_board
    random_bomb
    if num_mines > (width * height)
      return []
    else
      board = Array.new(height) { Array.new(width, 0) }
      num_of_mines = 0
      board.each_with_index do |row, i|
        row.each_with_index do |col, j|
          if num_of_mines < num_mines && @random_b[i * width + j] ==1
            board[i][j] = @random_b[i * width + j]
            num_of_mines += 1
          end
        end
      end
    end
    board = board.shuffle
  end
end