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
