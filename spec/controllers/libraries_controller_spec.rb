require 'rails_helper'

RSpec.describe LibrariesController, :type => :controller do
  before :each do
    @user = create(:user)
    log_in_user(@user)
  end

  describe "GET show" do
    before :each do
      @library = create(:library)
      Asset.destroy_all
    end

    context "without search, filter or sorting parameters" do
      it "assigns @assets" do
        assets = create_list(:asset, 5, library: @library, uploader: @user)

        get :show, params: { id: @library.id }

        expect(assigns[:assets].collect{|a| a.id}).to eql(@library.assets.order(created_at: :desc).collect{|a| a.id})
      end
    end

    context "with sorting parameters" do
      it "assigns @assets" do
        create(:asset, title: 'ddd', library: @library, uploader: @user)
        create(:asset, title: 'eee', library: @library, uploader: @user)
        create(:asset, title: 'aaa', library: @library, uploader: @user)
        create(:asset, title: 'bbb', library: @library, uploader: @user)
        create(:asset, title: 'ccc', library: @library, uploader: @user)

        get :show, params: { id: @library.id, sort: 'title_asc'}
        expect(assigns[:assets].collect{|a| a.id}).to eql(@library.assets.order(title: :asc).collect{|a| a.id})
      end
    end

    context "with filter parameters" do
      it "assigns @assets" do
        create_list(:asset, 5, library: @library, uploader: @user, file_type: :video)
        create(:asset, title: 'aaa', library: @library, uploader: @user, file_type: :audio)
        create(:asset, title: 'bbb', library: @library, uploader: @user, file_type: :document)

        get :show, params: { id: @library.id, filter: 'video'}
        expect(assigns[:assets].collect{|a| a.id}).to eql(@library.assets.where(file_type: :video).order(created_at: :desc).collect{|a| a.id})
      end
    end

    context "with search parameters" do
      it "assigns @assets" do
        create_list(:asset, 5, title: 'some name', library: @library, uploader: @user, file_type: :video)
        create(:asset, title: 'aaa', library: @library, uploader: @user, file_type: :audio)
        create(:asset, title: 'bbb', library: @library, uploader: @user, file_type: :document)

        get :show, params: { id: @library.id, search: 'some'}
        expect(assigns[:assets].collect{|a| a.id}).to eql(@library.assets.where('upper(title) LIKE ?', '%' + 'some'.upcase + '%').order(created_at: :desc).collect{|a| a.id})
      end
    end

    it "renders the 'show' template" do
      get :show, params: { id: @library.id }
      expect(response).to render_template(:show)
    end

    it "returns a 200 OK status" do
      get :show, params: { id: @library.id }
      expect(response).to be_ok
    end
  end
end
