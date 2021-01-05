require 'rails_helper'

RSpec.describe "tahun_akademiks/edit", type: :view do
  before(:each) do
    @tahun_akademik = assign(:tahun_akademik, TahunAkademik.create!(
      tahun: 1,
      ganjil: false
    ))
  end

  it "renders the edit tahun_akademik form" do
    render

    assert_select "form[action=?][method=?]", tahun_akademik_path(@tahun_akademik), "post" do

      assert_select "input[name=?]", "tahun_akademik[tahun]"

      assert_select "input[name=?]", "tahun_akademik[ganjil]"
    end
  end
end
