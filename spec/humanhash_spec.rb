require 'spec_helper'

describe "HumanHash" do

  describe "#uuid" do

    it "should return an Array containing a HumanHash and its UUID" do
      HumanHash.uuid.should be_kind_of(Array)
    end
  end
  
  describe "#humanize" do
    hex_digest = "535061bddb0549f691c8b9c012a55ee2"
    
    it "should accept a hex digest and return a HumanHash" do
      expect(HumanHash.humanize(hex_digest)).to eq "alpha-twenty-mockingbird-twelve"
    end

    it "should accept a separator" do
      expect(HumanHash.humanize(hex_digest, separator: '_')).to eq "alpha_twenty_mockingbird_twelve"
    end
  end

end

describe "HumanHash::HumanHasher" do
  wordlist = HumanHash::DEFAULT_WORDLIST

  it "should accept a wordlist" do
    expect { HumanHash::HumanHasher.new(wordlist: wordlist) }.not_to raise_error
  end

  describe "#uuid" do
    it "should return an Array containing a HumanHash and its UUID" do
      HumanHash::HumanHasher.new.uuid.should be_kind_of(Array)
    end
    
    it "should accept a separator" do
      expect(HumanHash::HumanHasher.new(separator: '_').uuid[0]).to match(/\w+_\w+_\w+_\w+/)
    end

  end

  describe "#humanize" do
    hex_digest = "535061bddb0549f691c8b9c012a55ee2"
    
    it "should accept a hex digest and return a HumanHash" do
      expect(HumanHash::HumanHasher.new.humanize(hex_digest)).to eq "alpha-twenty-mockingbird-twelve"
    end

    it "should accept a separator" do
      expect(HumanHash::HumanHasher.new(separator: '_').humanize(hex_digest)).to eq "alpha_twenty_mockingbird_twelve"
    end
  end

end
