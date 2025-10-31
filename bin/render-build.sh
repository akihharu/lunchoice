#!/usr/bin/env bash
# Renderがアプリケーションをビルドし、データベースを準備するためのスクリプト

# 1. 必要なGemをインストール
bundle install

# 2. 静的ファイル（CSS, JSなど）を本番用にコンパイル
bundle exec rails assets:precompile

# 3. データベースのマイグレーションを実行
# （デプロイ後、データベーススキーマを最新の状態にする）
bundle exec rails db:migrate