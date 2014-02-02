# encoding: utf-8

step 'トップページを表示する' do
  visit '/'
end

step '画面に :string と表示されていること' do |string|
  expect(page).to have_content(string)
end

step ":link をクリックする" do |name|
  click_link name
end

