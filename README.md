# Sinatra Handlebars

Helpers for serving Handlebars.js templates in [Sinatra][sinatra].

- Pre-compile handlebars templates from separate view files rather than littering them throughout your html.


## Installation
### Bundler users

If you use Bundler, add it to your *Gemfile.*

``` ruby
gem 'sinatra-handlebars',   git: 'http://github.com/benkitzelman/sinatra-handlebars'
```


## Setup

Install the plugin and add some options.

``` ruby
require 'sinatra/handlebars'

class App < Sinatra::Base
  register Sinatra::Handlebars
  handlebars {
    templates '/js/templates.js', ['app/templates/*']
  }
end
```


## Partials
Partial template filenames must be prefixed with an '_', and are referenced without the prefix.
For example, for the partial template file '_MyPartial.hbs', to render in a parent template it would be referenced as {{> MyPartial}}


## Sinatra AssetPack
If you're using the [sinatra-assetpack][assetpack] gem, add your served templates to a package.


[assetpack]: https://github.com/rstacruz/sinatra-assetpack
[ember]: http://emberjs.com
[sinatra]: http://sinatrarb.com
