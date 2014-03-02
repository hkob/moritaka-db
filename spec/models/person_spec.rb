require 'spec_helper'

describe Person do
  let(:person) { FactoryGirl.build(:person) }

  it '妥当なオブジェクトが生成されること' do
    expect(person).to be_valid
  end

  [ :title_id ].each do |key|
    it "#{key} は空であってはならない" do
      person[key] = ""
      expect(person).not_to be_valid
      expect(person.errors[key]).to be_present
    end
  end

  it "削除したときに対応するタイトルの人のリンクが消えること" do
    person.save
    title = person.title
    expect(title.person).to eq(person)
    person.destroy
    expect(title.person(true)).to be_nil
  end

  it "人が所属するタイトルが削除できないこと" do
    person.save
    title = person.title
    expect { title.destroy }.not_to change(Title, :count)
  end

end
