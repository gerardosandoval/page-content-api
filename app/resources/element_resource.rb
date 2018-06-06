class ElementResource < JSONAPI::Resource
  attributes :element_type, :content

  has_one :page
end