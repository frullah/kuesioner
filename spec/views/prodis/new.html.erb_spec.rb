require 'rails_helper'

RSpec.describe "prodis/new", type: :view do
  before(:each) do
    assign(:prodi, Prodi.new(
      nama: "MyString"
    ))
  end

  it "renders new prodi form" do
    render

    assert_select "form[action=?][method=?]", prodis_path, "post" do

      assert_select "input[name=?]", "prodi[nama]"
    end
  end
end
