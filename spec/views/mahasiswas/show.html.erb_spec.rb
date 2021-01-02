require 'rails_helper'

RSpec.describe "mahasiswas/show", type: :view do
  before(:each) do
    @mahasiswa = assign(:mahasiswa, FactoryBot.create(:mahasiswa))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@mahasiswa.npm}/)
    expect(rendered).to match(/#{@mahasiswa.nama}/)
    expect(rendered).to match(/#{@mahasiswa.prodi.nama}/)
  end
end
