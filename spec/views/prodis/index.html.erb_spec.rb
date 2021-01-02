require 'rails_helper'

RSpec.describe "prodis/index", type: :view do
  let(:items) do 
    FactoryBot.create_list(:prodi, 2)
    Prodi.page
  end

  before(:each) do
    assign(:prodis, items)
  end

  it "renders a list of prodis" do
    render
    assert_select "tr>td", text: items[0].nama, count: 1
    assert_select "tr>td", text: items[1].nama, count: 1
  end
end
