require "spec_helper"

describe HomeController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/" }.should route_to(:controller => "home", :action => "index")
    end

    it "routes root to generates home#index" do
      { :get => root_path }.should route_to(:controller => "home", :action => "index")
    end


    it "recognizes and generates #license" do
      { :get => "/license" }.should route_to(:controller => "home", :action => "license")
    end

    it "routes license_path to generates home#license" do
      { :get => license_path }.should route_to(:controller => "home", :action => "license")
    end

  end
end
