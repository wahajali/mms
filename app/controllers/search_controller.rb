class SearchController < ApplicationController
  def query
    @page = params[:page].blank? ? 1 : params[:page]
    @result = Patient.search(params["query"], per_page: 10, page: params[:page])
  end
end
