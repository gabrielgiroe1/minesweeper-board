require 'json'
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
    @array=Array.new(width*height,0)
    (0..num_mines).each do |i|
      @array[i] = 1
    end
    @array.shuffle!
  end

  def generate_board
    random_bomb
    if num_mines > (width * height)
      return []
    else
      board = Array.new(height) { Array.new(width, 0) }
      num_of_mines = 0
      (0...height).each do |i|
        (0...width).each do |j|
          if num_of_mines < num_mines && @array[i * width + j] == 1
            board[i][j] = @array[i * width + j]
            num_of_mines += 1
          end
          end
        end
    end
    board.to_json
  end
end