feature "login" do
  scenario "" do

    visit new_album_path
    find("#log-in").fill_in "Email", :with => user.email
    find("#log-in").fill_in "Password", :with => user.password

    click_on "Login"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Logged in")

  end

  scenario "" do

    album = FactoryGirl.create(:album)

    visit album_path
    find("#log-in").fill_in "Email", :with => user.email
    find("#log-in").fill_in "Password", :with => user.password

    click_on "Login"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Logged in")

  end
end