
module NinjaLinkHelper
  include ActionView::Helpers::UrlHelper

  # Redefined link_to to provide Ninja-style
  # graceful degradation.   If a :method option
  # was provided, this replaces the link with a form
  # and specifies a class so that NinjaScript will 
  # convert it to the expected link on Javascript-enabled
  # browsers.
  def link_to(*args, &block)
    p "********** running replacement link_to "
    # debugger
    if block_given?
      super(*args, &block)
    else
      html_options  = args[2]
    end
    
    if html_options and html_options[:method]
      degradable_form_for_link(*args, &block)
    else
      super(*args, &block)
    end    
  end
  
  def degradable_form_for_link(*args, &block)
    p "********** running degradable form_for"
    name          = args[0]
    options       = args[1] || {}
    html_options  = args[2]
    action        = url_for(options)
    
    content_tag(:form,  :action => action, :method => :post, :title => name, :class => "ninja degrade_form") do
      hidden_field_tag("_method", html_options[:method]) +
      hidden_field_tag("authenticity_token", session[:_csrf_token]) +
      submit_tag(name)
    end    
  end  
end
