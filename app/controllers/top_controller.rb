class TopController < ApplicationController
  def home
  end
  def about
  	@tops = Top.all
  end

end
