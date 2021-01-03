require 'rails_helper'

RSpec.describe "kategori_kuesioners/new", type: :view do
  before(:each) do
    assign(:kategori_kuesioner, KategoriKuesioner.new(
      nama: "MyString"
    ))
  end

  it "renders new kategori_kuesioner form" do
    render

    assert_select "form[action=?][method=?]", kategori_kuesioners_path, "post" do

      assert_select "input[name=?]", "kategori_kuesioner[nama]"
    end
  end
end
