class PagesController < ApplicationController
  before_action :find_page, only: [:create]

  def create
    if @page.can_be_indexed?
      @page.save
      @page.index_content
    else
      render json: { errors: @page.errors }, status: :unprocessable_entity and return
    end

    render json: @page.reload.serialize, status: :created
  end

  private

  def find_page
    @page ||= Page.find_or_initialize_by(url: sanitized_url)
  end

  def sanitized_url
    url = params[:url]
    if url.match('^(http|https):\/\/')
      url
    elsif url.match('^www.')
      "http://" + url
    else
      "http://www." + url
    end
  end
end