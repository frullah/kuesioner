require 'rails_helper'

RSpec.describe "kategori_kuesioners/show", type: :view do
  before(:each) do
    @kategori_kuesioner = assign(:kategori_kuesioner, KategoriKuesioner.create!(
      nama: "Nama"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nama/)
  end
end
