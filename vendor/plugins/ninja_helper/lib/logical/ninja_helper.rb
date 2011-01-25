module Logical::NinjaHelper
  require 'logical/ninja_link_helper'
  require 'logical/railtie'
  ActionController::Base.helper(Logical::NinjaLinkHelper)
end
