require 'rails_helper'

feature 'pictures' do
  context 'when user is on homepage' do
    before do
      sign_up('Tudor', 'test@email.com', '123456')
    end
    scenario 'no pictures have been added' do
      expect(page).to have_content 'No pictures have been added yet'
    end

    scenario 'it should display a prompt to add a picture' do
      expect(page).to have_content 'Add a picture'
    end

    scenario 'it can add a picture' do
      click_link 'Add a picture'
      page.attach_file('picture_image', Rails.root + 'spec/assets/test_picture.jpg')

      expect(page).to have_css("img[src*='test_picture.jpg']")
    end
  end
end
