require 'spec_helper'

feature "photo" do
  scenario "photo gets created" do

    album = FactoryGirl.create(:album)

    visit new_album_photo_path(album)
    fill_in "photo[name]", :with => "Water"
    attach_file "Picture", 'public/sample.jpg'

    click_on "Create Photo"

    expect(current_path).to eq(album_photo_path(album, Photo.last))
    expect(page).to have_content("successfully created")

  end
end