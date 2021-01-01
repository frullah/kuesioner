require 'rails_helper'

RSpec.describe "prodis/index", type: :view do
  before(:each) do
    assign(:prodis, [
      Prodi.create!(
        nama: "Nama"
      ),
      Prodi.create!(
        nama: "Nama"
      )
    ])
  end

  it "renders a list of prodis" do
    render
    assert_select "tr>td", text: "Nama".to_s, count: 2
  end
end
