require 'nokogiri'
require 'open-uri'
require "#{Rails.root}/lib/ElementParser"

class Page < ApplicationRecord
  has_many :elements
  has_many :links

  validates :url, presence: true, uniqueness: true
  validates :url, url: true

  def index_content
    doc = Nokogiri::HTML(parsed_html)
    clean_data if doc.elements.count > 0
    doc.css('h1, h2, h3', 'a').each do |element|
      ElementParser.new(self, element).create_element
    end
  end

  def can_be_indexed?
    parsed_html
  end

  def serialize
    JSONAPI::ResourceSerializer.new(PageResource).serialize_to_hash(PageResource.new(self, nil))
  end

  private

  def parsed_html
    @parsed_html ||=
      begin
        open(url)
      rescue Exception => e
        errors.add :url, "Can't index this URL, please try again or try with another URL"
        false
      end
  end

  def clean_data
    self.elements.delete_all
    self.links.delete_all
  end
end

