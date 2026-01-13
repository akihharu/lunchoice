require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前、メール、パスワードがあれば有効であること" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "メールアドレスがない場合は無効であること" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to be_present
  end
end