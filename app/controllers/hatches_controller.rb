class HatchesController < ApplicationController

  def new
    @hatch = Hatch.new
  end

  def create
    @hatch = Hatch.new(hatch_params)
    #position = Geocoder.search("50.496416, 30.503069", :lookup => :yandex)
    position = Geocoder.search("#{@hatch.latitude}, #{@hatch.longitude}", :lookup => :yandex)
    @hatch.address = position.first.data.first[1].first[1].first[1]["Address"]["formatted"]
    if @hatch.save
      @result = MechanizeOrder.call(hatch_id: @hatch.id)
      redirect_to root_path(@hatch), notice: @result.message
    else
      render :new
    end
  end

  private
  def hatch_params
    params.require(:hatch).permit(:a, :a1, :b, :c, :d, :latitude, :longitude, {photos: []}, {photos_cache: []})
  end
end
