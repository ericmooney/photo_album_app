require 'spec_helper'

feature "album" do
  scenario "album gets created and shows successful notification on next page" do
    user = FactoryGirl.create(:user)
    # I think I need to find a way to login first ,before this page is viewed
    visit new_album_path
    page.fill_in "album_name", :with => "Cold Winter"
    fill_in "album_user_id", :with => user.id
    click_on "Create Album"

    expect(current_path).to eq(album_path(Album.last))
    expect(page).to have_content("successfully created")
  end
end

