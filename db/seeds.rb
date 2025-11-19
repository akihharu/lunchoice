# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# 初期データの定義
# 形式: { name: '料理名', cuisine: '大カテゴリ', main_dish: '主食カテゴリ' }

dishes = []

# --- 🍚 和食 / 米 ---
dishes += [
  { name: 'カツ丼', cuisine: '和食', main_dish: '米' },
  { name: '親子丼', cuisine: '和食', main_dish: '米' },
  { name: 'お茶漬け', cuisine: '和食', main_dish: '米' },
  { name: '唐揚げ', cuisine: '和食', main_dish: '米' },
  { name: '冷や奴', cuisine: '和食', main_dish: '米' },
  { name: '卵焼き', cuisine: '和食', main_dish: '米' },
  { name: 'サバの味噌煮', cuisine: '和食', main_dish: '米' },
  { name: '牛丼', cuisine: '和食', main_dish: '米' },
  { name: '寿司', cuisine: '和食', main_dish: '米' },
  { name: 'TKG', cuisine: '和食', main_dish: '米' }
]

# --- 🍜 和食 / 麺 ---
dishes += [
  { name: 'ざるそば', cuisine: '和食', main_dish: '麺' },
  { name: 'ざるうどん', cuisine: '和食', main_dish: '麺' },
  { name: 'かけうどん', cuisine: '和食', main_dish: '麺' },
  { name: 'かけそば', cuisine: '和食', main_dish: '麺' },
  { name: '焼きそば', cuisine: '和食', main_dish: '麺' },
  { name: '焼きうどん', cuisine: '和食', main_dish: '麺' },
  { name: 'そうめん', cuisine: '和食', main_dish: '麺' }
]

# --- 🍞 和食 / その他 ---
dishes += [
  { name: 'お好み焼き', cuisine: '和食', main_dish: 'その他' },
  { name: 'たこ焼き', cuisine: '和食', main_dish: 'その他' },
  { name: '皿うどん', cuisine: '和食', main_dish: 'その他' },
  { name: 'もんじゃ焼き', cuisine: '和食', main_dish: 'その他' },
  { name: '焼きおにぎり', cuisine: '和食', main_dish: 'その他' },
  { name: 'やきいも', cuisine: '和食', main_dish: 'その他' }
]

# --- 🍚 洋食 / 米 ---
dishes += [
  { name: 'オムライス', cuisine: '洋食', main_dish: '米' },
  { name: 'ドリア', cuisine: '洋食', main_dish: '米' },
  { name: 'エビピラフ', cuisine: '洋食', main_dish: '米' },
  { name: 'タコライス', cuisine: '洋食', main_dish: '米' },
  { name: 'チキンライス', cuisine: '洋食', main_dish: '米' },
  { name: 'ハヤシライス', cuisine: '洋食', main_dish: '米' },
  { name: 'ジャンバラヤ', cuisine: '洋食', main_dish: '米' },
  { name: 'パエリア', cuisine: '洋食', main_dish: '米' },
  { name: 'リゾット', cuisine: '洋食', main_dish: '米' }
]

# --- 🍝 洋食 / 麺 ---
dishes += [
  { name: 'ナポリタン', cuisine: '洋食', main_dish: '麺' },
  { name: 'カルボナーラ', cuisine: '洋食', main_dish: '麺' },
  { name: 'ミートスパ', cuisine: '洋食', main_dish: '麺' },
  { name: 'ペペロンチーノ', cuisine: '洋食', main_dish: '麺' },
  { name: 'ボンゴレ', cuisine: '洋食', main_dish: '麺' },
  { name: 'ジェノベーゼ', cuisine: '洋食', main_dish: '麺' },
  { name: 'マカロニグラタン', cuisine: '洋食', main_dish: '麺' }
]

# --- 🍞 洋食 / その他 ---
dishes += [
  { name: 'サンドイッチ', cuisine: '洋食', main_dish: 'その他' },
  { name: 'ホットドッグ', cuisine: '洋食', main_dish: 'その他' },
  { name: 'フレンチトースト', cuisine: '洋食', main_dish: 'その他' },
  { name: 'パンケーキ', cuisine: '洋食', main_dish: 'その他' },
  { name: 'クロックムッシュ', cuisine: '洋食', main_dish: 'その他' },
  { name: 'ハンバーガー', cuisine: '洋食', main_dish: 'その他' },
  { name: 'キッシュ', cuisine: '洋食', main_dish: 'その他' },
  { name: 'ポテトガレット', cuisine: '洋食', main_dish: 'その他' }
]

# --- 🍚 中華 / 米 ---
dishes += [
  { name: '麻婆丼', cuisine: '中華', main_dish: '米' },
  { name: '中華丼', cuisine: '中華', main_dish: '米' },
  { name: 'チャーハン', cuisine: '中華', main_dish: '米' },
  { name: '天津飯', cuisine: '中華', main_dish: '米' },
  { name: 'ルーローハン', cuisine: '中華', main_dish: '米' },
  { name: 'ビビンバ', cuisine: '中華', main_dish: '米' },
  { name: '角煮丼', cuisine: '中華', main_dish: '米' },
  { name: '中華おこげ', cuisine: '中華', main_dish: '米' }
]

# --- 🍜 中華 / 麺 ---
dishes += [
  { name: 'ラーメン', cuisine: '中華', main_dish: '麺' },
  { name: 'タンタンメン', cuisine: '中華', main_dish: '麺' },
  { name: '酸辣湯麺', cuisine: '中華', main_dish: '麺' },
  { name: '餡掛け焼きそば', cuisine: '中華', main_dish: '麺' },
  { name: 'ざる中華', cuisine: '中華', main_dish: '麺' },
  { name: 'ワンタン麺', cuisine: '中華', main_dish: '麺' },
  { name: '冷やし中華', cuisine: '中華', main_dish: '麺' }
]

Dish.create!(dishes)

puts "--- 🍽️ Dish データ投入完了！総数: #{Dish.count} 件 ---"
