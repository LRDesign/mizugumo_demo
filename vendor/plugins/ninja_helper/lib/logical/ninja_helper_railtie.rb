module Logical
  class NinjaHelperRailtie << Rails::Railtie
    railtie_name :ninja_helper

    rake_task do
      load 'tasks/ninja_helper.rake'
    end
  end
end