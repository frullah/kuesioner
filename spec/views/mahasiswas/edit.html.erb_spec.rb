require 'rails_helper'

RSpec.describe "mahasiswas/edit", type: :view do
  before(:each) do
    @mahasiswa = assign(:mahasiswa, FactoryBot.create(:mahasiswa))
  end

  it "renders the edit mahasiswa form" do
    render
    assert_select "form[action=?][method=?]", mahasiswa_path(@mahasiswa), "post" do
      assert_select "input[name=?]", "mahasiswa[nama]"
      assert_select "select[name=?]", "mahasiswa[prodi_id]" do
        assert_select "option[value=?]", @mahasiswa.prodi.id.to_s
      end
    end
  end
end
