require './lib/sinatra/handlebars'
Gem::Specification.new do |s|
  s.name        = 'sinatra-handlebars'
  s.version     = Sinatra::Handlebars.version
  s.summary     = 'Helpers for serving a handlebars templates to an app from Sinatra.'
  s.description = 'Serves Handlebars pages.'
  s.authors     = ['Ben Kitzelman']
  s.email       = ['benkitzelman@hotmail.com']
  s.homepage    = 'http://github.com/benkitzelman/sinatra-handlebars'
  s.files       = `git ls-files`.strip.split("\n")
  s.executables = Dir['bin/*'].map { |f| File.basename(f) }

  s.add_dependency 'sinatra'
end
