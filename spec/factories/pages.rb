FactoryBot.define do
  factory :page do
    name { Faker::FunnyName.name }
    url { Faker::Internet.url }
    # association :element, factory: :element
    # association :links, factory: :link

    transient do
      count 5
    end
    
    after(:create) do |page, evaluator|
      create_list(:element, evaluator.count, page: page)
      create_list(:link, evaluator.count, page: page)
    end
  end
end