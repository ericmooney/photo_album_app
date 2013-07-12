FactoryGirl.define do

  factory :user do
    sequence(:email) {|n| "email#{n}@factory.com" }
    password "foobar"
    password_confirmation "foobar"
  end

  factory :album do
    name "Winter 2012"
    user
  end

  factory :photo do
    name "Coast Guard Practice"
    album
    picture File.open(File.join(Rails.root, '/public/sample.jpg'))
  end

end