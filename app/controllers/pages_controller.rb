class PagesController < ApplicationController
  before_action :find_page

  def create
    unless @page.valid?
      render json: { errors: @page.errors }, status: :unprocessable_entity and return
    end

    @page.index_content

    render json: @page.serialize, status: :created
  end

  private

  def find_page
    @page ||= Page.find_or_create_by(url: params[:url])
  end
end
