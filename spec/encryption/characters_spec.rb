require 'spec_helper'
require './encrypt'

describe Characters do
  it "encrypts a meassage using key and date" do
    @c = Characters.new
    map = @c.character_map
    expect(map[20]).to eql('u')
  end
end