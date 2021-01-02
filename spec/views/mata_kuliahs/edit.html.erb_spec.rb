# frozen_string_literal: true

require "rails_helper"

RSpec.describe "mata_kuliahs/edit", type: :view do
  before(:each) do
    @mata_kuliah = assign(:mata_kuliah, FactoryBot.create(:mata_kuliah))
  end

  it "renders the edit mata_kuliah form" do
    render

    assert_select "form[action=?][method=?]", mata_kuliah_path(@mata_kuliah), "post" do
      assert_select "input[name=?]", "mata_kuliah[nama]"
      assert_select "select[name=?]", "mata_kuliah[prodi_id]" do
        assert_select "option[value=?]", "1"
      end
      assert_select "input[name=?]", "mata_kuliah[sks]"
      assert_select "input[name=?]", "mata_kuliah[semester]"
    end
  end
end
