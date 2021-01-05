require 'rails_helper'

RSpec.describe "kelas/edit", type: :view do
  before(:each) do
    @kelas = assign(:kelas, FactoryBot.create(:kelas))
  end

  it "renders the edit kelas form" do
    render

    assert_select "form[action=?][method=?]", kelas_path(@kelas), "post" do

      assert_select "input[name=?]", "kelas[nama]"

      assert_select "select[name=?]", "kelas[prodi_id]"
    end
  end
end
