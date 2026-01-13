require 'rails_helper'

RSpec.describe "StaticPages", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "静的ページ（利用規約・プライバシーポリシー・使い方）が正しく表示されること" do
    visit terms_path
    expect(page).to have_content "利用規約"

    visit privacy_path
    expect(page).to have_content "プライバシーポリシー"

    visit guide_path
    expect(page).to have_content "使い方"
  end
end