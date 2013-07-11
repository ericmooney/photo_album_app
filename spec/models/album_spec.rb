require 'spec_helper'

describe Album do
  it "gets created" do
    album = FactoryGirl.create(:album)
    album.save

    albums = Album.all
    expect(albums).to include(album)
  end

  it "gets created without a name" do
    album = Album.new

    expect(album.valid?).to be_false
  end


  it "has many photos" do
    photo = FactoryGirl.create(:photo)
    album = photo.album

    expect(album.photos).to include(photo)
  end
end