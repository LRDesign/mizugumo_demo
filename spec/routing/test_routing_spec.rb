require "spec_helper"

describe TestController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/test" }.should route_to(:controller => "test", :action => "index")
    end
  end
end
