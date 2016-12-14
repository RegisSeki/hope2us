FactoryGirl.define do
  factory :donation do
    item
    user
    amount 1
    status 'pending_receipt'
    image do
      Rack::Test::UploadedFile
        .new(File.join(Rails.root, 'spec', 'support', 'images', 'forninho.jpg'))
    end
  end
end
