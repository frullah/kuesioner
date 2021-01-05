require 'rails_helper'

RSpec.describe "jadwal_mata_kuliahs/new", type: :view do
  before(:each) do
    assign(:jadwal_mata_kuliah, JadwalMataKuliah.new(
      mata_kuliah: nil,
      dosen: nil,
      tahun_akademik: nil,
      kelas: nil
    ))
  end

  it "renders new jadwal_mata_kuliah form" do
    render

    assert_select "form[action=?][method=?]", jadwal_mata_kuliahs_path, "post" do

      assert_select "input[name=?]", "jadwal_mata_kuliah[mata_kuliah_id]"

      assert_select "input[name=?]", "jadwal_mata_kuliah[dosen_id]"

      assert_select "input[name=?]", "jadwal_mata_kuliah[tahun_akademik_id]"

      assert_select "input[name=?]", "jadwal_mata_kuliah[kelas_id]"
    end
  end
end
