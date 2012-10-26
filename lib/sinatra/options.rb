module Sinatra
  module Handlebars
    class Options
      attr_reader :template_packages

      def initialize(app, &block)
        @app = app
        @template_packages = {}

        instance_eval(&block)
      end

      def templates(route, files=[])
        @template_packages[route] = files
      end
    end
  end
end