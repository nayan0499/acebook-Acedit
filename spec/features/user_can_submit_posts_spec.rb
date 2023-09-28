require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

  scenario "Can submit post and view them" do

    user = FactoryBot.create(:user) # Create a user using FactoryBot

    # Sign in the user through the interface using Capybara
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit "/posts"
    click_button "WRITE NEW POST"
    expect(page).not_to have_content("Signed in successfully.")
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Cannot submit empty post" do

    user = FactoryBot.create(:user) # Create a user using FactoryBot

    # Sign in the user through the interface using Capybara
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    visit "/posts"
    click_button "WRITE NEW POST"
    click_button "Submit"
    expect(page).to have_content("Cannot post empty message.")
  end

  scenario "Cannot submit post with the string 'facebook' and variations." do

    user = FactoryBot.create(:user) 
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    visit "/posts"
    click_button "WRITE NEW POST"
    fill_in "Message", with: "facebook"
    click_button "Submit"
    expect(page).to have_content("The F-word is forbidden!")
    visit "/posts"
    click_button "WRITE NEW POST"
    fill_in "Message", with: "FaceBook"
    click_button "Submit"
    expect(page).to have_content("The F-word is forbidden!")
    visit "/posts"
    click_button "WRITE NEW POST"
    fill_in "Message", with: "facebook is a rubbish site"
    click_button "Submit"
    expect(page).to have_content("The F-word is forbidden!")
    visit "/posts"
    click_button "WRITE NEW POST"
    fill_in "Message", with: "I hate facebook."
    click_button "Submit"
    expect(page).to have_content("The F-word is forbidden!")
  end

end
