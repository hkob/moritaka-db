# encoding: utf-8

step 'トップページを表示する' do
  visit '/'
end

step '画面に森高千里データベースと表示されていること' do
  expect(page).to have_content('森高千里データベース')
end
