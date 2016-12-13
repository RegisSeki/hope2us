FactoryGirl.define do
  factory :donation do
    item
    user
    amount 1
    status 'waiting'
  end
end
