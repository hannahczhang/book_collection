# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
    scenario 'valid inputs' do
        visit new_book_path
        fill_in "book[title]", with: 'harry potter'
        fill_in "book[author]", with: 'rick riordan'
        fill_in "book[price]", with: 24.99
        fill_in "book[published_date]", with: '2025-01-28'
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('harry potter')
    end
end