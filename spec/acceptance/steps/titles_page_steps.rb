# encoding: utf-8

step 'タイトル一覧を表示する' do
  visit titles_path(locate: :ja)
end

step 'タイトル追加ページを表示する' do
  visit new_title_path(locate: :ja)
end

step 'タイトルにダミーデータを登録する' do
  Title.create(japanese:'あいうえお', english:'AIUEO', yomi:'あいうえお')
end

step 'タイトルにテスト用データを登録する' do
  [ %w(ボーカル Vocal ぼーかる), %w(編曲 Arrangement へんきょく) ].each do |(japanese, english, yomi)|
    Title.create(japanese:japanese, english:english, yomi:yomi)
  end
end
