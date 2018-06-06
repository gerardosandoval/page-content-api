class Link < ApplicationRecord
  belongs_to :page
  belongs_to :element
end