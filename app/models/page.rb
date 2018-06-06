class Page < ApplicationRecord
  has_many :elements
  has_many :links

  validates :url, presence: true, uniqueness: true
  validates :url, url: true

  def index_content
    
  end

  def serialize
    JSONAPI::ResourceSerializer.new(PageResource).serialize_to_hash(PageResource.new(self, nil))
  end
end
