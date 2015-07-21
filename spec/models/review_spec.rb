require 'rails_helper'

describe Review, type: :model do
  
  it { is_expected.to belong_to :restaurant}
  
  it "gets deleted from database with restaurant" do
    pret = Restaurant.create(name: 'pret')
    pret.reviews.create(thoughts: 'meh', rating: '4')
    pret.destroy
    expect(Review.find_by(thoughts: 'meh')).to eq nil
  end
  
  it "is invalid if the rating is more than 5" do
    review = Review.new(rating: 10)
    expect(review).to have(1).error_on(:rating)
  end
end
