module ApplicationHelper
  def default_meta_tags
    {
      site: 'LUNCHOICE（ランチォイス）',
      title: '今日のランチを楽しく選んで記録する',
      reverse: true,
      separator: '|',
      description: '「何を食べよう？」を解決。自分のランチ履歴を記録し、みんなの投稿から新しいお気に入りを見つけよう！',
      keywords: 'ランチ,グルメ,食事記録,アプリ',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary',
      }
    }
  end
end
