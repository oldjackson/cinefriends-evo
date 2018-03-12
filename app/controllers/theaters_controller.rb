class TheatersController < ApplicationController
 def index

    @theaters = Theater.where.not(latitude: nil, longitude: nil)
      {
        lat: theater.latitude,
        lng: theater.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end

  end

end
