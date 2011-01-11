require 'spec_helper'

describe "test/index" do
  before(:each) do
    @product = assign(:product, Product.create(:name => "ProdName",
      :description => "ProdDescription",
      :price => 10.00
    ))
  end

  it "renders a show link" do
    render
    rendered.should have_selector("a", :content => "Show Product", :href => product_path(@product))
  end
end
