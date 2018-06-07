class PageResource < JSONAPI::Resource
  has_many :elements
  has_many :links
  attributes :url
  filter :url
end