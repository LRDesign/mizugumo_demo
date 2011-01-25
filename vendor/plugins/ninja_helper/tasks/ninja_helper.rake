namespace :ninja_helper do

  desc "Install NinjaHelper Files"
  task :install => [
      'javascripts/jquery.ninja_script.js',
      'javascripts/jquery-1.4.2.js'
  ] do
    # copy css (unless --sass specified)
    # copy sass (if --sass specified)
    # require images/ui
    # copy images/ui/spinner.gif
    # append default behavior to application.js
  end

  file 'javascripts/jquery.ninja_script.js' do
    cp "#{plugin_path}/../javascripts/jquery.ninja_script.js", "#{Rails.root}/public/javascripts/"
  end

  file 'javascripts/jquery-1.4.2.js' do
    cp "#{plugin_path}/../javascripts/jquery-1.4.2.js", "#{Rails.root}/public/javascripts/"
  end

end

# shorthand aliases
namespace :nh do
  task :install => "ninja_helper:install"
end


def plugin_path
  File.dirname(__FILE__)
end

