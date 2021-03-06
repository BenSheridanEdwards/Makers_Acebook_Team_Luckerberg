# require 'rails_helper'

RSpec.feature "Timeline", js: true, type: :feature do
  scenario "Can submit comments on posts and edit them" do
    signup
    click_on "New Post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(current_path).to eq("/#{my_user_id('ben@example.com')}")

    click_on "Comments"
    fill_in :comment_text, with: "My comment"
    click_on "Add"
    expect(page).to have_content("My comment")
    click_on "edit_comment"
    fill_in :edit_comment_text, with: "Edited comment"
    click_on "edit_comment_submit"

    expect(page).to have_content("Edited comment")
  end
end
