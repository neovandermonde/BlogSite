class BloghomeController < ApplicationController
  def index
    @blogposts = Blogpost.order(date_posted: :desc)
  end
end
