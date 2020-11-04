class MoviesController < ApplicationController
  def index
    if params[:query].present?
      @results = PgSearch.multisearch(params[:query])
    else
      @movies = Movie.all
    end
  end
end
