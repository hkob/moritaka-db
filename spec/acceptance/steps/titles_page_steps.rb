# encoding: utf-8

step 'タイトル一覧を表示する' do
  visit titles_path
end

step 'タイトル追加ページを表示する' do
  visit new_title_path
end
