# This is a development-only rake task to update the version of NinjaScript
# when Judson makes changes

namespace :ninja do
  desc "DEV ONLY: pull and copy in the latest ninjascript"
  task :update do
    ninjapath = Rails.root + '../NinjaScript'
    destpath = Rails.root + 'public/javascripts/'
    system "cd #{ninjapath}"
    system "git pull"
    system "cp #{ninjapath}/javascript/jquery.ninja_script.js #{destpath}"
  end
end