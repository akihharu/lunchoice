require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:dish) { create(:dish) }

  it "ユーザー、料理、写真があれば有効であること" do
    post = build(:post, user: user, dish: dish)
    post.photo.attach(io: File.open(Rails.root.join('spec/fixtures/test_image.png')), filename: 'test.png', content_type: 'image/png')
    expect(post).to be_valid
  end

  it "写真がない場合は無効であること" do
    post = build(:post, user: user, dish: dish, photo: nil)
    post.valid?
    expect(post.errors[:photo]).to be_present
  end
end