class HomeController < ApplicationController
  def index
    @new_shop = Shop.where('created_at >= ?', 1.week.ago).count
    @shop = Shop.all.count
    @escape = Escape.all.count
    # @club = Club.all.count
  end
end
