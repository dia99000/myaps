class TopController < ApplicationController
  def home
  end
  def about
  	@tops = Top.all
  	@colors = Color.all
  	@color = Color.new
  end

end
