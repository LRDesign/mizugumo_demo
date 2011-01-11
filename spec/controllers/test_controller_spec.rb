require 'spec_helper'

describe TestController do
  describe "GET index" do
    it "assigns a product @product" do
      get :index
      assigns(:product).should be_a(Product)
    end
  end
end
