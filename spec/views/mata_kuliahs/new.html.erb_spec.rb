# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "mata_kuliahs/new", type: :view do
  before(:each) do
    @mata_kuliah = MataKuliah.new(
      nama: "MyString",
      prodi: Prodi.create!(nama: "prodi1"),
      sks: 1,
      semester: 1
    )
    assign(:mata_kuliah, @mata_kuliah)
  end

  it "renders new mata_kuliah form" do
    render

    assert_select "form[action=?][method=?]", mata_kuliahs_path, "post" do
      assert_select "input[name=?]", "mata_kuliah[nama]"
      assert_select "select[name=?]", "mata_kuliah[prodi_id]" do
        assert_select "option[value=?]", @mata_kuliah.prodi.id.to_s
      end
      assert_select "input[name=?]", "mata_kuliah[sks]"
      assert_select "input[name=?]", "mata_kuliah[semester]"
    end
  end
end
