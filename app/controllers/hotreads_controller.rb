class HotreadsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @hotreads = Read.top_ten_daily
  end

  def create
    @read = Read.where(url: params[:url])
    if @read.empty?
      read = Read.create(url: params[:url])
      read.hits.create
    else
      @read.first.hits.create
    end
  end
end
