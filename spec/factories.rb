FactoryGirl.define do
  factory :album do
    name "Winter 2012"
  end

  factory :photo do
    name "Coast Guard Practice"
    album
    picture File.open(File.join(Rails.root, '/public/sample.jpg'))
  end

end