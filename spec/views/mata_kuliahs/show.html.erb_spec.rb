# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "mata_kuliahs/show", type: :view do
  before(:each) do
    @mata_kuliah = assign(:mata_kuliah, MataKuliah.create!(
      nama: "Nama",
      prodi: Prodi.create!(nama: "prodi1"),
      sks: 2,
      semester: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nama/)
    expect(rendered).to match(/prodi1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
