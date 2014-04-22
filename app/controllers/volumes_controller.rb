class VolumesController < ApplicationController
  def index
  end

  def search
    @volumes = VolumeSearchApi.search_for(params[:volume])
    if @volumes.empty?
      redirect_to volumes_path, notice: "No results with #{params[:volume]}"
    else
      session['volume'] = params[:volume]
      render :index
    end
  end

  def show
    @volumes = VolumeSearchApi.search_for(session['volume'])
    @volume = @volumes.select {|p| p.id == params[:id]}.first
    render :show
  end
end