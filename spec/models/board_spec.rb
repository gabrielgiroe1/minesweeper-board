require 'rails_helper'
require 'factory_bot'
RSpec.describe Board, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with valid attributes" do
    board = build(:board)
    expect(board).to be_valid
  end

  it "is not valid without a board name" do
    board = build(:board, board_name: nil)
    expect(board).to_not be_valid
  end

  it "is not valid without an email" do
    board = build(:board, email: nil)
    expect(board).to_not be_valid
  end

  it "is not valid with an invalid email" do
    board = build(:board, email: "invalid_email")
    expect(board).to_not be_valid
  end
end
