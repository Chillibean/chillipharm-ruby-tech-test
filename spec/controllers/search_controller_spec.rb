require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  let!(:user) { create(:user)}
  let!(:another_user) { create(:user)}
  let!(:another_user_search) { create(:search, user: another_user)}

  describe "GET index" do
    before do
      create_list(:search, 5, user: user)
    end

    subject(:show_search_history) { get :index }

    it "shows a search history" do
      show_search_history
      expect(assigns[:search_history].collect{|s| s.id}).to eql(user.search.collect{|s| s.id})
    end

    it "renders the 'index' template" do
      show_search_history
      expect(response).to render_template(:index)
    end

    it "returns a 200 OK status" do
      show_search_history
      expect(response).to be_ok
    end
  end

  describe "GET destroy" do
    before do
      @user_search = create(:search, user: user)
    end

    subject(:destroy_search) { get :destroy, params: {id: @user_search.id} }

    it "change search count" do
      expect {
        destroy_search
      }.to change(Search, :count).by(-1)
    end

    it "page redirect to search history" do
      destroy_search
      expect(response).to redirect_to(search_index_path)
    end
  end
end
