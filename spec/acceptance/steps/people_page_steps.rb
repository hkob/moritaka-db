# encoding: utf-8

step '人一覧を表示する' do
  visit people_path(locate: :ja)
end

step '人にテスト用データを登録する' do
  send 'タイトルにテスト用データを登録する'
  %w(森高千里 伊秩弘将 HIRO 斉藤英夫).each do |japanese|
    Title.japanese_value_is(japanese).first.create_person
  end
end

