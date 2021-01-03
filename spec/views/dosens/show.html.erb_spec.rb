require 'rails_helper'

RSpec.describe "dosens/show", type: :view do
  before(:each) do
    @dosen = assign(:dosen, Dosen.create!(
      nidn: "Nidn",
      nama: "Nama",
      pendidikan: "Pendidikan"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nidn/)
    expect(rendered).to match(/Nama/)
    expect(rendered).to match(/Pendidikan/)
  end
end
