FactoryGirl.define do
  factory :comic do
    sequence(:title) { |n| "Test Comic #{n}"}
    summary "This is a summary."
    description { "This is an extremely very super long description, y'know, eh? " * 5 }
    created_at { Time.now }
    updated_at { Time.now }
    published_at { Time.now }
    published true
    sequence(:slug) { |n| "test-comic-#{n}"}

    factory :unpublished do
      published false
    end
  end
end