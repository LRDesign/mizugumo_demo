// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
Ninja.behavior({
  // ".contains_ajax ninja.graceful_form": Ninja.submits_as_ajax,
  ".make_ajax": Ninja.submits_as_ajax,
  ".new_product": Ninja.submits_as_ajax,
  ".edit_product": Ninja.submits_as_ajax,
  ".ninja.graceful_form": Ninja.becomes_link
})