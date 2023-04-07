require 'json'

class Board < ApplicationRecord
  validates :width, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :height, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :num_mines, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: :max_mines }
  validates :board_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :generate_board, presence: true

  def max_mines
    width * height
  end

  def random_bomb
    @positions = []
    (0..(height - 1)).each do |i|
      (0..(width - 1)).each do |j|
        @positions << [i, j]
      end
    end
    @positions = @positions.shuffle.first(num_mines)
  end

  def generate_board
    random_bomb
    if num_mines > (width * height)
      return []
    else
      board = Array.new(height) { Array.new(width, 0) }
      num_of_mines = 0
      @positions.each do |i, j|
        board[i][j] = 1
      end
    end
    board.to_json
  end
end