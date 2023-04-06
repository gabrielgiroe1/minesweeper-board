FactoryBot.define do
  factory :board, class: 'Board' do
    board_name { "MyBoard" }
    email { "board@example.com" }
    width { 3 }
    height { 3 }
    num_mines { 5 }
    board_data { "[[1, 1, 0], [0, 1, 0], [0, 1, 1]]"}
  end
end