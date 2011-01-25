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

  it "renders a delete form with method and authenticity token" do
    render
    rendered.should have_selector('.delete_method') do |outer_scope|
      outer_scope.should have_selector(:form, :action => product_path(@product), :title => "Delete Product",
          :class => "ninja graceful_form"
        ) do |scope|
        scope.should have_selector(:input, :name => "commit", :type => "submit", :value => "Delete Product")
        scope.should have_selector(:input, :name => "_method", :value => "delete", :type => "hidden")
        scope.should have_selector(:input, :name => "authenticity_token")
      end
    end
  end

  it "renders a put form with method and authenticity token" do
    render
    rendered.should have_selector('.put_method') do |outer_scope|
      outer_scope.should have_selector(:form, :action => product_path(@product), :title => "Put Product",
          :class => "ninja graceful_form"
        ) do |scope|
        scope.should have_selector(:input, :name => "commit", :type => "submit", :value => "Put Product")
        scope.should have_selector(:input, :name => "_method", :value => "put", :type => "hidden")
        scope.should have_selector(:input, :name => "authenticity_token")
      end
    end
  end

  it "renders a delete form with an image submit button" do
    # <input src="/images/press_it.png" type="image" />
    render
    rendered.should have_selector('.image') do |outer_scope|
      outer_scope.should have_selector(:form, :action => product_path(@product),
          :class => "ninja graceful_form"
        ) do |scope|
        scope.should have_xpath( 'input[@type="image"][starts-with(@src, "/images/press_it.png")]' )
        scope.should have_selector(:input, :name => "_method", :value => "delete", :type => "hidden")
        scope.should have_selector(:input, :name => "authenticity_token")
      end
    end
  end

  it "renders a delete form with an image submit button" do
    # <input src="/images/press_it.png" type="image" />
    render
    rendered.should have_selector('.image_and_text') do |outer_scope|
      outer_scope.should have_selector(:form, :action => product_path(@product),
          :class => "ninja graceful_form"
        ) do |scope|
        scope.should have_xpath( 'input[@type="image"][starts-with(@src, "/images/press_it.png")]' )
        scope.should have_selector(:input, :name => "_method", :value => "delete", :type => "hidden")
        scope.should have_selector(:input, :name => "authenticity_token")
      end
    end
  end


end

