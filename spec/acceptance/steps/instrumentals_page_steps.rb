# encoding: utf-8

step '楽器一覧を表示する' do
  visit instrumentals_path(locate: :ja)
end

step '楽器にテスト用データを登録する' do
  send 'タイトルにテスト用データを登録する'
  %w(Vocal Arrangement).zip([10, 20]).each do |(english, sort_order)|
    Title.english_value_is(english).first.create_instrumental(sort_order:sort_order)
  end
end

