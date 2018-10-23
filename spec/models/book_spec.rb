require 'rails_helper'
require 'shoulda/matchers'

describe Book, type: :model do
  it { should validate_presence_of(:gender) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:image) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:editor) }
  it { should validate_presence_of(:year) }

  subject(:book) do
    Book.new(gender: gender, author: author, image: image,
             title: title, editor: editor, year: year)
  end

  let(:gender) { Faker::Food.dish }
  let(:author) { Faker::Simpsons.character }
  let(:image) { Faker::Simpsons.quote }
  let(:title) { Faker::Food.dish }
  let(:editor) { Faker::Simpsons.location }
  let(:year) { Faker::Number.within(1993..1999) }

  it do
    is_expected.to be_valid
  end

  describe '#create' do
    context 'When the gender is nil' do
      let(:gender) { nil }
      it do
        is_expected.to be_invalid
      end
    end

    context 'When the author is nil' do
      let(:author) { nil }
      it do
        is_expected.to be_invalid
      end
    end
  end
end
