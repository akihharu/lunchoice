require 'rails_helper'

RSpec.describe "Posts", type: :system do
  let!(:user) { create(:user) }
  let!(:dish) { create(:dish, name: "カレーライス") }

  before do
    driven_by(:rack_test)
  end

  it "ログインしてランチの記録ができること" do
    visit new_user_session_path
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button "ログイン"

    expect(page).to have_content "ログインしました"

    visit new_post_path

    select "カレーライス", from: "post[dish_id]"

    attach_file "post[photo]", Rails.root.join('spec/fixtures/test_image.png')
    click_button "投稿する"

    expect(page).to have_content "新しいランチを投稿しました！"
  end

  it "誤った情報ではログインできないこと" do
    visit new_user_session_path
    fill_in "user[email]", with: "wrong@example.com"
    fill_in "user[password]", with: "wrongpassword"
    click_button "ログイン"
    expect(page).to have_content "Eメールまたはパスワードが違います"
  end
  it "料理を選択せずに投稿するとエラーが表示されること" do
    visit new_user_session_path
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button "ログイン"

    visit new_post_path
    click_button "投稿する"

    expect(page).to have_content "入力してください"
  end

  it "ログアウトできること" do
    visit new_user_session_path
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button "ログイン"

    click_link "ログアウト"
    expect(page).to have_content "ログアウトしました"
  end

  it "食事履歴一覧を表示できること" do
    visit new_user_session_path
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button "ログイン"

    visit posts_path 
    expect(page).to have_content "食事履歴"
  end

  it "料理一覧ページ（Dishes）が正しく表示されること" do
    visit new_user_session_path
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button "ログイン"

    visit "/dishes" 
    
    expect(page).to have_content "みんなのランチ"
  end
end