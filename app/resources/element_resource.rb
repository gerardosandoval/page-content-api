class ElementResource < JSONAPI::Resource
  immutable

  attributes :element_type, :content
  has_one :page
end