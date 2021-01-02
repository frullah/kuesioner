require 'rails_helper'

RSpec.describe "mahasiswas/new", type: :view do
  before(:each) do
    assign(:mahasiswa, FactoryBot.build(:mahasiswa))
  end

  it "renders new mahasiswa form" do
    render

    assert_select "form[action=?][method=?]", mahasiswas_path, "post" do
      assert_select "input[name=?]", "mahasiswa[npm]"
      assert_select "input[name=?]", "mahasiswa[nama]"
      assert_select "select[name=?]", "mahasiswa[prodi_id]"
    end
  end
end
