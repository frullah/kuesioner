require "rails_helper"

RSpec.describe "prodis/show", type: :view do
  before(:each) do
    @prodi = assign(:prodi, Prodi.create!(
      nama: "Nama"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nama/)
  end
end
