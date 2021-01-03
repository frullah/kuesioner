require 'rails_helper'

RSpec.describe "dosens/index", type: :view do
  before(:each) do
    assign(:dosens, [
      Dosen.create!(
        nidn: "Nidn",
        nama: "Nama",
        pendidikan: "Pendidikan"
      ),
      Dosen.create!(
        nidn: "Nidn",
        nama: "Nama",
        pendidikan: "Pendidikan"
      )
    ])
  end

  it "renders a list of dosens" do
    render
    assert_select "tr>td", text: "Nidn".to_s, count: 2
    assert_select "tr>td", text: "Nama".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Pendidikan".to_s, count: 2
  end
end
