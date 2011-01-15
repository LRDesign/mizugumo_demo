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
      outer_scope.should have_selector(:form, :action => product_path(@product), :title => "Delete Product") do |scope|
        scope.should have_selector(:input, :name => "commit", :value => "Delete Product")
        scope.should have_selector(:input, :name => "_method", :value => "delete", :type => "hidden")
        scope.should have_selector(:input, :name => "authenticity_token")
      end    
    end
  end
  
  it "renders a put form with method and authenticity token" do
    render
    rendered.should have_selector('.put_method') do |outer_scope|    
      outer_scope.should have_selector(:form, :action => product_path(@product), :title => "Put Product") do |scope|
        scope.should have_selector "input[name='commit'][value='Put Product'][type='submit']"
        scope.should have_selector 'input[name="_method"][value="put"][type="hidden"]'
        scope.should have_selector(:input, :name => "authenticity_token")
      end    
    end
  end
  
  it "renders a delete form with an image submit button" do
    # <input src="/images/press_it.png" type="image" />
    rendered.should have_selector('.delete_with_image') do |outer_scope|    
      outer_scope.should have_selector(:form, :action => product_path(@product), :title => "Delete Product") do |scope|
        scope.should have_selector(:input, :src => "/images/press_it.png", :type => "image")
        scope.should have_selector(:input, :name => "_method", :value => "delete", :type => "hidden")
        scope.should have_selector(:input, :name => "authenticity_token")
      end    
    end
  end
  
end

# within 'form[name="search"] select[name="type"]' do |scope|
#    scope.should have_selector 'option[value="blah"]'
#    scope.should have_selector 'option[value="gah"]'
#    scope.should have_selector 'option[value="eep"]'
#    scope.should have_selector 'input:only-of-type'
#    scope.should have_selector 'input[name="query"]'
#    scope.should have_selector 'input[type="text"]'
#  end
