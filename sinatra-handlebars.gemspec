require './lib/sinatra/handlebars'
Gem::Specification.new do |s|
  s.name        = 'sinatra-handlebars'
  s.version     = Sinatra::Handlebars.version
  s.summary     = 'Compile Handlebars templates as Javascript and serve in a Sinatra app'
  s.description = 'Compiles and serves Handlebars template files (.hbs) as javascript from the configured Sinatra route, so they can be included as script from a given web page'
  s.authors     = ['Ben Kitzelman']
  s.email       = ['benkitzelman@hotmail.com']
  s.homepage    = 'http://github.com/benkitzelman/sinatra-handlebars'
  s.files       = `git ls-files`.strip.split("\n")
  s.executables = Dir['bin/*'].map { |f| File.basename(f) }

  s.add_dependency 'sinatra'
end
