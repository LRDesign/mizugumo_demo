class TestController < ApplicationController
  def index
    Product.delete_all
    @product = Product.create(:name => "ProdName", :description => "ProdDescription", :price => 10.00)
  end

  def rails_js
  end

end
