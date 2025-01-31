# location: spec/book/sunny_day_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
    subject do
        described_class.new(title: 'harry potter', author: 'rick riordan', price: 24.99, published_date: '2025-01-28')
    end
    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end
end

RSpec.describe 'Adding a book', type: :feature do
    scenario 'valid inputs' do
        visit new_book_path
        fill_in "book[title]", with: 'harry potter'
        fill_in "book[author]", with: 'rick riordan'
        fill_in "book[price]", with: 24.99
        fill_in "book[published_date]", with: '2025-01-28'
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('harry potter')
        expect(page).to have_content('rick riordan')
        expect(page).to have_content(24.99)
        expect(page).to have_content('2025-01-28')
    end
end