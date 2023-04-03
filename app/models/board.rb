class Board < ApplicationRecord
  validates :width, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :height, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :num_mines, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :board_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :generate_board, presence: true

  def generate_board
    if num_mines > (width * height)
      return []
    else
      board = Array.new(height) { Array.new(width, 0) }
      num_of_mines = 0
      board.each_with_index do |row, i|
        row.each_with_index do |col, j|
          if num_of_mines < num_mines
            board[i][j] = 1
            num_of_mines += 1
          end
        end
      end
    end
    board = board.shuffle
  end
end