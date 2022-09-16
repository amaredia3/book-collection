# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'Harry Potter'
    fill_in 'Author', with: 'JK Rowling'
    fill_in 'Price', with: 39.99
    select '2005', :from => 'book_published_1i'
    select 'February', :from => 'book_published_2i'
    select '1', :from => 'book_published_3i'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('Harry Potter')
    expect(page).to have_content('JK Rowling')
    expect(page).to have_content('39.99')
    expect(page).to have_content('2005-02-01')
  end
end
