
require "Top_Movies_Of/version"

Gem::Specification.new do |spec|
  spec.name          = "Top_Movies_Of"
  spec.version       = "0.2.0"
  spec.authors       = ["'Parv Kumar'"]
  spec.email         = ["'parvathikumar92@gmail.com'"]
  spec.files         = ["lib/Top_Movies_Of.rb", "lib/Top_Movies_Of/cli.rb", "lib/Top_Movies_Of/movie.rb", "lib/Top_Movies_Of/scraper.rb", "lib/Top_Movies_Of/version.rb"]
  spec.summary       = "Find Top Movies"
  spec.description   = "X"
  spec.homepage      = "http://rubygems.org/gems/top-movies-of"
  spec.license       = "MIT"
  spec.executables << 'top_movies_of'



  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
  spec.add_development_dependency "nikkou", ">= 0"

end
