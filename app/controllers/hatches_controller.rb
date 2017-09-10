class HatchesController < ApplicationController

  def new
    @hatch = Hatch.new
  end

  def create
    @hatch = Hatch.new(hatch_params)
    if @hatch.save
      @result = SendOrder.call(hatch_id: @hatch.id)
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
