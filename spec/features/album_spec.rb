require 'spec_helper'

feature "album" do
  scenario "album gets created and shows successful notification on next page" do

    visit new_album_path
    fill_in "album[name]", :with => "Cold Winter"

    click_on "Create Album"

    expect(current_path).to eq(album_path(Album.last))
    expect(page).to have_content("successfully created")
  end
end

