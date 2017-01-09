class HotreadsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @hotreads = Read.all
  end

  def create
    @read = Read.where(url: params[:url])
    if @read.empty?
      Read.create(url: params[:url])
    else
      current_hits = @read.first.hits
      @read.first.update_attribute(:hits, current_hits + 1)
    end
  end
end
