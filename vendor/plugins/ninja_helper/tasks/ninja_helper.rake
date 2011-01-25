namespace :ninja_helper do

  desc "Install NinjaHelper Files"
  task :install do
    p "running rake task"
  end

end

# shorthand aliases
namespace :nh do
  task :install => "ninja_helper:install"
end