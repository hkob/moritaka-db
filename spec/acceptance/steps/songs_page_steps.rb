# encoding: utf-8

step '曲一覧を表示する' do
  visit songs_path(locate: :ja)
end

step '曲にテスト用データを登録する' do
  send '西暦にテスト用データを登録する'
  send 'タイトルにテスト用データを登録する'
  %w(渡良瀬橋 雨 Rain).zip(%w(1993 1990 1990)).each do |(japanese, y)|
    year = Year.year_value_is(y.to_i).first
    Title.japanese_value_is(japanese).first.create_song(year_id:year.id)
  end
end


