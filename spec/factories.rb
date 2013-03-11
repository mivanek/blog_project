FactoryGirl.define do

  factory :article do
    title "Hello world"
    body "This is a test article"
  end

  factory :user do
    name "Example user"
    email "user@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
