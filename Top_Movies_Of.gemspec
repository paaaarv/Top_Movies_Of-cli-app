
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "Top_Movies_Of/version"

Gem::Specification.new do |spec|
  spec.name          = "Top_Movies_Of"
  spec.version       = TopMoviesOf::VERSION
  spec.authors       = ["'Parv Kumar'"]
  spec.email         = ["'parvathikumar92@gmail.com'"]
  spec.files         = ["lib/Top_Movies_Of.rb", "lib/Top_Movies_Of/cli.rb", "lib/Top_Movies_Of/movie.rb", "lib/Top_Movies_Of/scraper.rb", "lib/Top_Movies_Of/version.rb"]
  spec.summary       = "Find Top Movies"
  spec.description   = "X"
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"
  spec.executables << 'top_movies_of'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
