# This is a development-only rake task to update the version of NinjaScript
# when Judson makes changes

namespace :demo do
  desc "generate a few fake products"
  task :fake_data => :environment do
    8.times do
      Product.create!(
        :name => words(1..2),
        :description => words(2..5),
        :price => rand(100)
      )
    end
  end
end

def words(num_or_range)
  case(num_or_range)
    when Range: WORDS.shuffle[num_or_range].join(" ")
    when Integer: WORDS.shuffle[0..num_or_range].join(" ")
  end
end


#TODO:  Change this once Populator is available for R3

LIPSUM = "Fusce nisl odio dictum et mollis quis ultrices eget augue Integer vulputate elementum commodo Curabitur ornare pulvinar libero a lacinia lorem tristique ut Suspendisse convallis faucibus justo eget molestie Nunc sit amet magna ligula Sed ut risus ut arcu fermentum facilisis Etiam vestibulum nisi sit amet lacus interdum sit amet placerat quam placerat Aenean faucibus enim id feugiat sodales ante orci rutrum erat quis vulputate augue urna vitae magna Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas Duis molestie massa sit amet elit ultrices ornare Nulla condimentum dui vel massa vulputate elementum Integer velit nisi placerat at suscipit id fringilla vitae felis Vestibulum non dui ut orci ultricies sagittis Donec posuere accumsan urna in venenatis Proin vel massa elit quis dapibus felis Maecenas consequat ante eu nisl molestie interdum Fusce molestie mi non venenatis consectetur purus ante interdum sem id congue arcu mi vitae tortor Quisque lobortis gravida nisl quis convallis Mauris tempor ullamcorper leo a egestas quam tempus sit amet Nullam eleifend dui a accumsan gravida lorem dolor convallis erat ac ornare velit mauris nec ipsum"
WORDS = LIPSUM.split(' ')