require 'rails_helper'

RSpec.describe "tahun_akademiks/index", type: :view do
  before(:each) do
    assign(:tahun_akademiks, [
      TahunAkademik.create!(
        tahun: 2,
        ganjil: false
      ),
      TahunAkademik.create!(
        tahun: 2,
        ganjil: false
      )
    ])
  end

  it "renders a list of tahun_akademiks" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
