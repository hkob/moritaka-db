require 'spec_helper'

describe Year do
  let(:year) { FactoryGirl.build(:year) }

  it '妥当なオブジェクトが生成されること' do
    expect(year).to be_valid
  end

  [ :year ].each do |key|
    it "#{key} は空であってはならない" do
      year[key] = ""
      expect(year).not_to be_valid
      expect(year.errors[key]).to be_present
    end
  end



end
