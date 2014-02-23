# encoding: utf-8

step '西暦一覧を表示する' do
  visit years_path(locate: :ja)
end

step '西暦追加ページを表示する' do
  visit new_year_path(locate: :ja)
end

step '西暦にテスト用データを登録する' do
  %w(1987 1988).each do |year|
    Year.create(year:year)
  end
end


