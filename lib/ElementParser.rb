class ElementParser

  attr_reader :page, :element

  def initialize(page, element)
    @page = page
    @element = element
  end

  def create_element
    case element.name 
    when "h1", "h2", "h3"
      create_tag
    when "a"
      create_link
    end
  end

  def create_tag
    return unless element.text
    Element.create(element_type: element.name, content: element.text, page: page)
  end

  def create_link
    return unless element.attributes["href"].try(:value)
    Link.create(url: element.attributes["href"].value, page: page)
  end
end