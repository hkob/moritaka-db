# encoding: utf-8

step 'トップページを表示する' do
  visit '/'
end

step '画面に :string と表示されていること' do |string|
  expect(page).to have_content(string)
end

step '画面に :string と表示されていないこと' do |string|
  expect(page).not_to have_content(string)
end

step ':link をクリックする' do |name|
  click_link name
end

step ':button ボタンをクリックする' do |name|
  click_button name
end

step ':label に :value と入力する' do |label, value|
  fill_in label, with:value
end

step ':from から :value を選択する' do |from, value|
  select value, from:from
end

step "運用環境である" do
  Rails.stub_chain(:env, :production?).and_return(true)
  Rails.stub_chain(:env, :development?).and_return(false)
end

step 'id が :name である行の :link をクリックする' do |name, link|
  within("//tr[@id='#{name}']") do
    click_link link
  end
end

step 'id が :name である行に :string と表示されていること' do |name, string|
  within("//tr[@id='#{name}']") do
    expect(page).to have_content(string)
  end
end

step 'id が :name である行に :string と表示されていないこと' do |name, string|
  within("//tr[@id='#{name}']") do
    expect(page).not_to have_content(string)
  end
end

