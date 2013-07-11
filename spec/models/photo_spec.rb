require 'spec_helper'

describe Photo do
  it "gets created" do
    photo = FactoryGirl.create(:photo)
    photo.save

    photos = Photo.all
    expect(photos).to include(photo)
  end

  it "gets created without a name" do
    album = FactoryGirl.create(:album)
    photo = Photo.new(:album_id => album.id, :picture => File.open(File.join(Rails.root, '/public/sample.jpg')))

    expect(photo.valid?).to be_true
  end

  it "gets created without a picture" do
    album = FactoryGirl.create(:album)
    photo = Photo.new(:album_id => album.id,:name => "Cold Winter")

    expect(photo.valid?).to be_false
  end

  it "gets created without an album associated" do
    photo = Photo.new(:picture => File.open(File.join(Rails.root, '/public/sample.jpg')), :name => "Cold Winter")

    expect(photo.valid?).to be_false
  end

  it "has a picture" do
    photo = FactoryGirl.create(:photo)

    expect(photo.picture).to_not be_nil
  end
end