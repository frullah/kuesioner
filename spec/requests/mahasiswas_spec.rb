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

RSpec.describe "/mahasiswas", type: :request do
  # Mahasiswa. As you add validations to Mahasiswa, be sure to
  # adjust the attributes here as well.
  def make_attributes
    {
      **FactoryBot.attributes_for(:mahasiswa, prodi_id: FactoryBot.create(:prodi).id),
      user_attributes: FactoryBot.build_stubbed(:user).slice(:password, :email)
    }
  end
  
  let(:valid_attributes) { make_attributes }

  let(:invalid_attributes) {
    {
      npm: "",
      nama: "",
      prodi_id: nil,
      user_attributes: {password: ""}
    }
  }

  before { sign_in FactoryBot.build_stubbed(:user, :admin) }

  describe "GET /index" do
    it "renders a successful response" do
      Mahasiswa.create! valid_attributes
      get mahasiswas_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      mahasiswa = Mahasiswa.create! valid_attributes
      get mahasiswa_url(mahasiswa)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_mahasiswa_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      mahasiswa = Mahasiswa.create! valid_attributes
      get edit_mahasiswa_url(mahasiswa)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Mahasiswa" do
        expect {
          post mahasiswas_url, params: {mahasiswa: valid_attributes}
        }.to change(Mahasiswa, :count).by(1)
      end

      it "redirects to the created mahasiswa" do
        post mahasiswas_url, params: {mahasiswa: valid_attributes}
        expect(response).to redirect_to(mahasiswa_url(Mahasiswa.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Mahasiswa" do
        expect {
          post mahasiswas_url, params: {mahasiswa: invalid_attributes}
        }.to change(Mahasiswa, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post mahasiswas_url, params: {mahasiswa: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        make_attributes
      }

      it "updates the requested mahasiswa" do
        mahasiswa = Mahasiswa.create! valid_attributes
        patch mahasiswa_url(mahasiswa), params: {mahasiswa: new_attributes}
        mahasiswa.reload
        expect(mahasiswa.npm).to eq(new_attributes[:npm])
        expect(mahasiswa.nama).to eq(new_attributes[:nama])
        expect(mahasiswa.prodi_id).to eq(new_attributes[:prodi_id])
        expect(mahasiswa.user.username).to eq(new_attributes[:npm])
        expect(mahasiswa.user.valid_password?(new_attributes[:user_attributes][:password]))
          .to be(true)
      end

      it "should allow update without password" do
        mahasiswa = Mahasiswa.create! valid_attributes
        new_attributes[:user_attributes][:id] = mahasiswa.user.id
        new_attributes[:user_attributes][:password] = ""
        patch mahasiswa_url(mahasiswa), params: {mahasiswa: new_attributes}
        mahasiswa.reload
        expect(mahasiswa.npm).to eq(new_attributes[:npm])
        expect(mahasiswa.nama).to eq(new_attributes[:nama])
        expect(mahasiswa.prodi_id).to eq(new_attributes[:prodi_id])
        expect(mahasiswa.user.username).to eq(new_attributes[:npm])
      end

      it "redirects to the mahasiswa" do
        mahasiswa = Mahasiswa.create! valid_attributes
        patch mahasiswa_url(mahasiswa), params: {mahasiswa: new_attributes}
        mahasiswa.reload
        expect(response).to redirect_to(mahasiswa_url(mahasiswa))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        mahasiswa = Mahasiswa.new valid_attributes
        mahasiswa.save!
        patch mahasiswa_url(mahasiswa), params: {mahasiswa: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested mahasiswa" do
      mahasiswa = Mahasiswa.create! valid_attributes
      expect {
        delete mahasiswa_url(mahasiswa)
      }.to change(Mahasiswa, :count).by(-1)
    end

    it "redirects to the mahasiswas list" do
      mahasiswa = Mahasiswa.create! valid_attributes
      delete mahasiswa_url(mahasiswa)
      expect(response).to redirect_to(mahasiswas_url)
    end
  end
end