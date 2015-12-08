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

  def leave_review(thoughts, rating)
    sign_up
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: thoughts
    select rating, from: 'Rating'
    click_button 'Leave Review'
  end

  scenario 'displays an averahe rating for all reviews' do
    leave_review('So so', '3')
    click_link 'Sign out'
    sign_up_2
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'great'
    select 5, from: 'Rating'
    click_button 'Leave Review'
    expect(page).to have_content('Average rating: ★★★★☆')
  end
end
