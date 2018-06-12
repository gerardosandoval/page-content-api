require 'rails_helper'

RSpec.describe Page, type: :model do
  it { should have_many(:elements) }
  it { should have_many(:links) }
  it { should validate_presence_of(:url) }
end