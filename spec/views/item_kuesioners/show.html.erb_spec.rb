require 'rails_helper'

RSpec.describe "item_kuesioners/show", type: :view do
  before(:each) do
    @item_kuesioner = assign(:item_kuesioner, ItemKuesioner.create!(
      kategori_kuesioner: nil,
      pertanyaan: "pertanyaan"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/pertanyaan/)
  end
end
