# location: spec/attribute/author_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
    subject do
        described_class.new(title: 'harry potter', author: 'rick riordan', price: 24.99, published_date: '2025-01-28')
    end
    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end
    
    it 'is not valid without a author' do
        subject.author = nil
        expect(subject).not_to be_valid
    end
end

RSpec.describe 'Creating a book', type: :feature do
    scenario 'valid author' do
        visit new_book_path
        fill_in "book[title]", with: 'harry potter'
        fill_in "book[author]", with: 'rick riordan'
        fill_in "book[price]", with: 24.99
        fill_in "book[published_date]", with: '2025-01-28'
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('rick riordan')
    end
end