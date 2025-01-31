# location: spec/book/rainy_day_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do    
    subject do
        described_class.new(title: 'harry potter', author: 'rick riordan', price: 24.99, published_date: '2025-01-28')
    end
    it 'is not valid without a name' do
        subject.title = nil
        expect(subject).not_to be_valid
    end
end