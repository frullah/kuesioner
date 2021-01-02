# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "mata_kuliahs/index", type: :view do
  before(:each) do
    assign(:mata_kuliahs, [
      MataKuliah.create!(
        nama: "Nama",
        prodi: Prodi.create!(nama: "prodi1"),
        sks: 2,
        semester: 3
      ),
      MataKuliah.create!(
        nama: "Nama",
        prodi: Prodi.create!(nama: "prodi2"),
        sks: 2,
        semester: 3
      )
    ])
  end

  it "renders a list of mata_kuliahs" do
    render
    assert_select "tr>td", text: "Nama".to_s, count: 2
    assert_select "tr>td", text: "prodi1".to_s
    assert_select "tr>td", text: "prodi2".to_s
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
