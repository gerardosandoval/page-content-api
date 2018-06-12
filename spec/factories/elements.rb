FactoryBot.define do
  factory :element do
    element_type { Faker::Types.random_type }
    content { Faker::GameOfThrones.quote }
  end
end