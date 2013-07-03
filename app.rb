require 'bundler'
Bundler.require
require './schema.rb'

class App < Sinatra::Base
  set :root, File.dirname(__FILE__)

  register Sinatra::CompassSupport

  c = Compass.configuration
  c.project_path     = root
  c.images_dir       = "app/images"
  c.http_images_path = "/images"

  register Sinatra::AssetPack
  assets do
    js_compression :jsmin

		css_compression :sass

    js :main, '/js/main.js', [
      '/js/vendor/*.js',
      '/js/*.js'
    ]

    css :main, [
			'/css/vendor/*.css',
      '/css/*.css'
    ]

    css :more, '/css/more.css', [
      '/css/more/*.css'
    ]

    prebuild true
	end	
		get '/' do
			slim :table
  	end
end
