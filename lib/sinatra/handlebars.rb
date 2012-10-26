module Sinatra
  module Handlebars
    def self.version
      "0.0.1"
    end

    def self.registered(app)
      app.extend ClassMethods
    end

    module ClassMethods
      # set handlebars options
      def handlebars(&block)
        @handlebars_options ||= Options.new(self, &block)
        self.handlebars_init! if block_given?
        @handlebars_options
      end

      def js_content(paths)
        @js_content ||= %{
          (function() {
            window.HandlebarsTemplates = {};
            #{templates_as_javascript(paths).join("\n")}
          })();
        }.strip.gsub(/^ {16}/, '')
      end

      def templates_as_javascript(paths)
        template_paths(paths).map do |(name, path)|
          content = File.read(path)
          if name ~= /^_/
            "Handlebars.registerPartial(#{name.sub(/^_/, '').inspect}, #{content.inspect});"
          else
            "window.HandlebarsTemplates[#{name.inspect}] = Handlebars.compile(#{content.inspect});"
          end
        end
      end

      def template_paths(paths)
        template_paths = {}
        paths.each do |path|
          template_paths[File.basename(path, '.hbs')] = path
        end
        template_paths
      end

      def handlebars_init!
        handlebars.template_packages.each do |route, globs|
          get route do
            mtime, output = @template_cache.fetch(route) do

              paths = globs.map do |glob|
                glob = File.expand_path(glob)
                Dir[glob].map { |x| x.squeeze('/') }
              end.flatten.uniq

              # compute the maximum mtime for all paths
              mtime = paths.map do |path|
                if File.file?(path)
                  File.mtime(path).to_i
                end
              end.compact.max

              [mtime, js_content(paths)]
            end

            content_type :js
            last_modified mtime
            output
          end
        end
      end
    end

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
