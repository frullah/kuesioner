require 'rails_helper'

RSpec.describe "tahun_akademiks/new", type: :view do
  before(:each) do
    assign(:tahun_akademik, TahunAkademik.new(
      tahun: 1,
      ganjil: false
    ))
  end

  it "renders new tahun_akademik form" do
    render

    assert_select "form[action=?][method=?]", tahun_akademiks_path, "post" do

      assert_select "input[name=?]", "tahun_akademik[tahun]"

      assert_select "input[name=?]", "tahun_akademik[ganjil]"
    end
  end
end
