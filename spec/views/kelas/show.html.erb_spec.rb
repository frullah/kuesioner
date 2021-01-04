require 'rails_helper'

RSpec.describe "kelas/show", type: :view do
  before(:each) do
    @kelas = assign(:kelas, Kelas.create!(
      nama: "Nama",
      prodi: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nama/)
    expect(rendered).to match(//)
  end
end
