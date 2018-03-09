class TheatersController < ApplicationController
 def index

    @theaters = params[:search].nil? || params[:search].strip.empty? ? Theater.all.where.not(latitude: nil, longitude: nil) : Theater.search(params[:search]).where.not(latitude: nil, longitude: nil)
        @markers = @theaters.map do |theater|
      {
        lat: theater.latitude,
        lng: theater.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end

  end

end
