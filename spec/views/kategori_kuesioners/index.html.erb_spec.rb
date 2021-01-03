require 'rails_helper'

RSpec.describe "kategori_kuesioners/index", type: :view do
  before(:each) do
    assign(:kategori_kuesioners, [
      KategoriKuesioner.create!(
        nama: "Nama"
      ),
      KategoriKuesioner.create!(
        nama: "Nama"
      )
    ])
  end

  it "renders a list of kategori_kuesioners" do
    render
    assert_select "tr>td", text: "Nama".to_s, count: 2
  end
end
