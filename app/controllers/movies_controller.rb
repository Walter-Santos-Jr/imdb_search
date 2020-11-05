class MoviesController < ApplicationController
  def index
    if params[:query].present?
      @results = PgSearch.multisearch(params[:query])
    else
      @results = Movie.all
    end
  end
end
