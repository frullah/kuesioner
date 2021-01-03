require 'rails_helper'

RSpec.describe "kategori_kuesioners/edit", type: :view do
  before(:each) do
    @kategori_kuesioner = assign(:kategori_kuesioner, KategoriKuesioner.create!(
      nama: "MyString"
    ))
  end

  it "renders the edit kategori_kuesioner form" do
    render

    assert_select "form[action=?][method=?]", kategori_kuesioner_path(@kategori_kuesioner), "post" do

      assert_select "input[name=?]", "kategori_kuesioner[nama]"
    end
  end
end
