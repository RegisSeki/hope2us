FactoryGirl.define do
  factory :item do
    sequence(:name) { |n| "item #{n}" }
    sequence(:description) { |n| "descrição do item #{n}" }
    amount 1
    reserved 0
    confirmed 0
  end
end
