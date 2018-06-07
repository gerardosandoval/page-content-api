class LinkResource < JSONAPI::Resource
  immutable

  attributes :url
  has_one :page
end