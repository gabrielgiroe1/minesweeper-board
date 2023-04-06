FactoryBot.define do
  factory :board, class: 'Board' do
    board_name { "MyBoard" }
    email { "board@example.com" }
    width { 10 }
    height { 10 }
    num_mines { 5 }
  end
end