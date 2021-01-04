require 'rails_helper'

RSpec.describe "kelas/new", type: :view do
  before(:each) do
    assign(:kelas, Kelas.new(
      nama: "MyString",
      prodi: nil
    ))
  end

  it "renders new kelas form" do
    render

    assert_select "form[action=?][method=?]", kelas_index_path, "post" do

      assert_select "input[name=?]", "kelas[nama]"

      assert_select "input[name=?]", "kelas[prodi_id]"
    end
  end
end
