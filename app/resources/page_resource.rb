class PageResource < JSONAPI::Resource
  attributes :url, :elements, :links
  filter :url

  def elements
    @model.elements.as_json(only: [:id, :element_type, :content])
  end

  def links
    @model.links.as_json(only: [:id, :url])
  end
end