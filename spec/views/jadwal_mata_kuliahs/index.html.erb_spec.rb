require 'rails_helper'

RSpec.describe "jadwal_mata_kuliahs/index", type: :view do
  before(:each) do
    assign(:jadwal_mata_kuliahs, [
      JadwalMataKuliah.create!(
        mata_kuliah: nil,
        dosen: nil,
        tahun_akademik: nil,
        kelas: nil
      ),
      JadwalMataKuliah.create!(
        mata_kuliah: nil,
        dosen: nil,
        tahun_akademik: nil,
        kelas: nil
      )
    ])
  end

  it "renders a list of jadwal_mata_kuliahs" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
