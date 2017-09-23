class HatchesController < ApplicationController
  def new
    @hatch = Hatch.new
  end

  def create
    @hatch = Hatch.new(hatch_params)
    get_position(@hatch)
    if @hatch.save
      @result = call(@hatch)
      redirect_to root_path(@hatch)
    else
      render :new
    end
  end

  def get_position(hatch)
    position = Geocoder.search("#{hatch.latitude}, #{hatch.longitude}")
    hatch.address = position.first.data['GeoObject']['metaDataProperty']['GeocoderMetaData']['text']
  end

  def call(hatch)
    text_message = write_message(hatch)
    agent = Mechanize.new
    mech_login(agent)
    mech_fill_form(hatch, agent, text_message)
  end

  def mech_login(agent)
    agent.get('http://xn--80accfiasjf8cghbfut2k.xn--p1ai/request?g=112')
    form = agent.page.forms.first
    form.log = 'devico'
    form.pass = 'hatch7hatch'
    form.submit
  end

  def mech_fill_form(hatch, agent, text_message)
    _country, _city, street, building = hatch.address.split(', ')
    form = agent.page.forms.first
    form = agent.page.forms.first
    form.str = street
    form.home = building
    form.file_uploads.first.file_name = hatch.photos.first.file.file
    form.submit
    form = agent.page.forms.first
    form.editor_content = text_message
  end

  def write_message(hatch)
    WriteMessage.new({ a: @hatch.a,
                       a1: @hatch.a1,
                       b: @hatch.b,
                       c: @hatch.c,
                       d: @hatch.d,
                       latitude: @hatch.latitude,
                       longitude: @hatch.longitude,
                       address: @hatch.address }).create_message_text
  end

  private

  def hatch_params
    params.require(:hatch)
          .permit(:a,
                  :a1,
                  :b,
                  :c,
                  :d,
                  :latitude,
                  :longitude,
                  photos: [],
                  photos_cache: [])
  end
end
