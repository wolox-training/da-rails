require 'rails_helper'
require 'shoulda/matchers'

describe Book, type: :model do
    it do
        should validate_presence_of(:gender)
    end
    it do
        should validate_presence_of(:author)
    end
    it do
        should validate_presence_of(:image)
    end
    it do
        should validate_presence_of(:title)
    end
    it do
        should validate_presence_of(:editor)
    end
    it do
        should validate_presence_of(:year)
    end

    subject(:book) do
        Book.new(gender: gender, author: author, image: image, title: title, editor: editor, year: year)
    end

    let(:gender) { Faker::Food.dish }
    let(:author) { Faker::Simpsons.character }
    let(:image) { Faker::Simpsons.quote }
    let(:title) { Faker::Food.dish }
    let(:editor) { Faker::Simpsons.location }
    let(:year) { '1993' }

    it do
        is_expected.to be_valid
    end

    describe '#create' do
        context 'When the gender is nil' do
            let(:gender) {nil}
            it do
                is_expected.to be_invalid
            end
        end

        context 'When the author is nil' do
            let(:author) {nil}
            it do
                is_expected.to be_invalid
            end
        end
    end
end