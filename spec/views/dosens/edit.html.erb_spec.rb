require 'rails_helper'

RSpec.describe "dosens/edit", type: :view do
  before(:each) do
    @dosen = assign(:dosen, Dosen.create!(
      nidn: "MyString",
      nama: "MyString",
      pendidikan: "MyString"
    ))
  end

  it "renders the edit dosen form" do
    render

    assert_select "form[action=?][method=?]", dosen_path(@dosen), "post" do

      assert_select "input[name=?]", "dosen[nidn]"

      assert_select "input[name=?]", "dosen[nama]"

      assert_select "input[name=?]", "dosen[pendidikan]"
    end
  end
end
