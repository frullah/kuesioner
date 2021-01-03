require 'rails_helper'

RSpec.describe "dosens/new", type: :view do
  before(:each) do
    assign(:dosen, Dosen.new(
      nidn: "MyString",
      nama: "MyString",
      pendidikan: "MyString"
    ))
  end

  it "renders new dosen form" do
    render

    assert_select "form[action=?][method=?]", dosens_path, "post" do

      assert_select "input[name=?]", "dosen[nidn]"

      assert_select "input[name=?]", "dosen[nama]"

      assert_select "input[name=?]", "dosen[pendidikan]"
    end
  end
end
