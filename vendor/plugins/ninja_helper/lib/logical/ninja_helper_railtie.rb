module Logical
  class NinjaHelperRailtie < Rails::Railtie
    railtie_name :ninja_helper

    rake_tasks do
      load 'tasks/ninja_helper.rake'
    end
  end
end