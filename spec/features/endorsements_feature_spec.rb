require 'rails_helper'

feature 'endorsing review' do
  before do
    kfc = Restaurant.create(name: "KFC")
    kfc.reviews.create(rating: 3, thoughts: 'It was an abomination')
  end

  scenario 'a user can endorse a review, which updates the review endorsment count' do
    visit 'restaurants'
    click_link 'Endorse Review'
    expect(page).to have_content('1 endorsment')
  end
end
