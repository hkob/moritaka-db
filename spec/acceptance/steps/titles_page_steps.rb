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
  if Title.count == 0
    data = [
      %w(ボーカル Vocal ぼーかる),
      %w(編曲 Arrangement へんきょく),
      [ "森高千里", "Chisato Moritaka", "もりたか　ちさと" ],
      [ "伊秩弘将", "Hiromasa Ijichi", "いぢち　ひろまさ" ],
      [ "HIRO", "HIRO", "ひろ" ],
      [ "斉藤英夫", "Hideo Saito", "さいとう　ひでお" ],
      [ "渡良瀬橋", "{WATARASEBASHI}", "わたらせばし" ],
      [ "雨", "{AME}", "あめ" ],
      [ "Rain", "Rain", "れいん" ],
      [ "NEW SEASON", "NEW SEASON", "にゅーしーずん" ],
      [ "ミーハー", "Mi-HA-", "みーはー" ],
    ]
    data.each do |(japanese, english, yomi)|
      Title.create(japanese:japanese, english:english, yomi:yomi)
    end
  end
end
