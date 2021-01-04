require 'rails_helper'

RSpec.describe "kelas/index", type: :view do
  before(:each) do
    assign(:kelas, [
      Kelas.create!(
        nama: "Nama",
        prodi: nil
      ),
      Kelas.create!(
        nama: "Nama",
        prodi: nil
      )
    ])
  end

  it "renders a list of kelas" do
    render
    assert_select "tr>td", text: "Nama".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
