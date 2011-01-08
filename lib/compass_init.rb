# Enables support for Compass, a stylesheet authoring framework based on SASS.
# See http://compass-style.org/ for more details.
# Store Compass/SASS files (by default) within 'app/stylesheets'

module CompassInitializer
  def self.registered(app)
    require 'sass/plugin/rack'

    Compass.configuration do |config|
      config.project_path = Padrino.root
      config.sass_dir = "app/stylesheets"
      config.project_type = :stand_alone

      config.http_path = "/"

      config.css_dir = "public/stylesheets"
      config.http_stylesheets_path = "/stylesheets"

      config.images_dir = "public/images"
      config.http_images_path = "/images"

      config.javascripts_dir = "public/javascripts"
      config.http_javascripts_path = "/javascripts"

      config.output_style = :compressed
    end

    Compass.configure_sass_plugin!
    Compass.handle_configuration_change!

    # Sass::Plugin.options.merge!(Compass.sass_engine_options)

    app.use Sass::Plugin::Rack
  end
end
