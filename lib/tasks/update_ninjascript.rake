# This is a development-only rake task to update the version of NinjaScript
# when Judson makes changes

namespace :dev do
  desc "DEV ONLY: pull and copy in the latest ninjascript"
  task :update do
    ninjapath = Rails.root + '../NinjaScript'
    destpath = Rails.root + 'public/'
    system "cd #{ninjapath}"
    system "git pull"
    system "cp #{ninjapath}/javascript/jquery.ninja_script.js #{destpath}/javascripts/"
    system "mkdir -p #{destpath}/images/ui"
    system "cp #{ninjapath}/images/ui/spinner.gif #{destpath}/images/ui/"
  end
end