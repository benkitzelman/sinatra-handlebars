# Sinatra Handlebars

[![endorse](https://api.coderwall.com/benkitzelman/endorsecount.png)](https://coderwall.com/benkitzelman)

Helpers for serving Handlebars.js templates in [Sinatra][sinatra].

- Pre-compile handlebars templates from separate view files rather than littering them throughout your html.


## Installation

``` ruby
gem install sinatra-handlebars
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


[handlebars.js]: http://handlebarsjs.com/
[sinatra]: http://sinatrarb.com
