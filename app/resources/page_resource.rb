class PageResource < JSONAPI::Resource
  has_many :elements
  attributes :url

  filter :url
end