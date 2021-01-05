require 'rails_helper'

RSpec.describe "tahun_akademiks/show", type: :view do
  before(:each) do
    @tahun_akademik = assign(:tahun_akademik, TahunAkademik.create!(
      tahun: 2,
      ganjil: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
  end
end
