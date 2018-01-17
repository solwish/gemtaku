class HomeController < ApplicationController
  def index
    @escape = Escape.all.count
    # @club = Club.all.count
  end
end
