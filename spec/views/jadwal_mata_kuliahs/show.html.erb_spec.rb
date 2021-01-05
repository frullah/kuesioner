require 'rails_helper'

RSpec.describe "jadwal_mata_kuliahs/show", type: :view do
  before(:each) do
    @jadwal_mata_kuliah = assign(:jadwal_mata_kuliah, JadwalMataKuliah.create!(
      mata_kuliah: nil,
      dosen: nil,
      tahun_akademik: nil,
      kelas: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
