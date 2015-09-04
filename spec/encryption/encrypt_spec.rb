require 'spec_helper'
require './encrypt'

describe Encrypt do
  it "encrypts a meassage using key and date" do
    @e = Encrypt.new
    encrypted = @e.encrypt_message("seyi is here..end..", "14168", "300815")
    expect(encrypted.length).to eql(19)
  end
end