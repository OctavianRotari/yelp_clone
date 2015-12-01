require 'rails_helper'
require_relative './../helpers/user_helper_spec.rb'

feature 'reviewing' do
  before { Restaurant.create name: 'KFC'}

  scenario 'allows users to leave a review using a form' do
    sign_up
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: 'so so'
    select '3', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end
end
