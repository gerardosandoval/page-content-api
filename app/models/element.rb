class Element < ApplicationRecord
  belongs_to :page
  has_one :link
end
