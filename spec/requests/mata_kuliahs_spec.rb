require "rails_helper"

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/mata_kuliahs", type: :request do
  # MataKuliah. As you add validations to MataKuliah, be sure to
  # adjust the attributes here as well.

  let(:valid_attributes) {
    FactoryBot.attributes_for(:mata_kuliah, prodi_id: FactoryBot.create(:prodi).id)
  }

  let(:invalid_attributes) {
    {
      nama: "",
      sks: 10,
      semester: 15
    }
  }

  before(:each) { sign_in FactoryBot.build_stubbed(:user, :admin) }

  describe "GET /index" do
    it "renders a successful response" do
      MataKuliah.create! valid_attributes
      get mata_kuliahs_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      mata_kuliah = MataKuliah.create! valid_attributes
      get mata_kuliah_url(mata_kuliah)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_mata_kuliah_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      mata_kuliah = MataKuliah.create! valid_attributes
      get edit_mata_kuliah_url(mata_kuliah)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new MataKuliah" do
        expect {
          post mata_kuliahs_url, params: {mata_kuliah: valid_attributes}
        }.to change(MataKuliah, :count).by(1)
      end

      it "redirects to the created mata_kuliah" do
        post mata_kuliahs_url, params: {mata_kuliah: valid_attributes}
        expect(response).to redirect_to(mata_kuliah_url(MataKuliah.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new MataKuliah" do
        expect {
          post mata_kuliahs_url, params: {mata_kuliah: invalid_attributes}
        }.to change(MataKuliah, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post mata_kuliahs_url, params: {mata_kuliah: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        FactoryBot.attributes_for(:mata_kuliah, prodi_id: FactoryBot.create(:prodi).id)
      }

      it "updates the requested mata_kuliah" do
        mata_kuliah = MataKuliah.create! valid_attributes
        patch mata_kuliah_url(mata_kuliah), params: {mata_kuliah: new_attributes}
        mata_kuliah.reload
        expect(mata_kuliah.nama).to eq(new_attributes[:nama])
        expect(mata_kuliah.sks).to eq(new_attributes[:sks])
        expect(mata_kuliah.semester).to eq(new_attributes[:semester])
        expect(mata_kuliah.prodi_id).to eq(new_attributes[:prodi_id])
      end

      it "redirects to the mata_kuliah" do
        mata_kuliah = MataKuliah.create! valid_attributes
        patch mata_kuliah_url(mata_kuliah), params: {mata_kuliah: new_attributes}
        mata_kuliah.reload
        expect(response).to redirect_to(mata_kuliah_url(mata_kuliah))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        mata_kuliah = MataKuliah.create! valid_attributes
        patch mata_kuliah_url(mata_kuliah), params: {mata_kuliah: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested mata_kuliah" do
      mata_kuliah = MataKuliah.create! valid_attributes
      expect {
        delete mata_kuliah_url(mata_kuliah)
      }.to change(MataKuliah, :count).by(-1)
    end

    it "redirects to the mata_kuliahs list" do
      mata_kuliah = MataKuliah.create! valid_attributes
      delete mata_kuliah_url(mata_kuliah)
      expect(response).to redirect_to(mata_kuliahs_url)
    end
  end
end
