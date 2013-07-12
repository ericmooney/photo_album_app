require 'spec_helper'

describe User do
  it 'saves a new user' do
    user = FactoryGirl.build(:user)
    visit signup_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    fill_in "Password confirmation", :with => user.password
    click_button "Create User"

    expect(current_path).to eq(users_path)
    expect(page).to have_content("Activation Email Sent")
  end
end
