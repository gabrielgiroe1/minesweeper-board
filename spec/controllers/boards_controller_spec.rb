require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end

    it "assigns all boards to @boards" do
      board1 = create(:board)
      board2 = create(:board)
      get :index
      expect(assigns(:boards)).to eq([board2, board1])
    end
  end

  describe "GET #show" do
    it "returns a successful response" do
      board = create(:board)
      get :show, params: { id: board.id }
      expect(response).to be_successful
    end

    it "assigns the requested board to @board" do
      board = create(:board)
      get :show, params: { id: board.id }
      expect(assigns(:board)).to eq(board)
    end
  end

  describe "GET #new" do
    it "returns a successful response" do
      get :new
      expect(response).to be_successful
    end

    it "assigns a new board to @board" do
      get :new
      expect(assigns(:board)).to be_a_new(Board)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new board" do
        expect {
          post :create, params: { board: attributes_for(:board) }
        }.to change(Board, :count).by(1)
      end

      it "redirects to the new board" do
        post :create, params: { board: attributes_for(:board) }
        expect(response).to redirect_to(board_path(Board.last))
      end
    end
    context "with invalid attributes" do
      it "does not create a new board" do
        expect {
          post :create, params: { board: attributes_for(:board, board_name: nil) }
        }.to_not change(Board, :count)
      end

      it "re-renders the new method" do
        post :create, params: { board: attributes_for(:board, board_name: nil) }
        expect(response).to render_template :new
      end
    end
  end
end