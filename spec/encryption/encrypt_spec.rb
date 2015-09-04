require 'spec_helper'
require './encrypt'

describe Encrypt do
  it "encrypts a meassage using key and date" do
    key = "14168"
    date = "300815"
    @e = Encrypt.new
    encrypted = @e.encrypt_message("seyi is here..end..", key, date)
    expect(encrypted.length).to eql(19)
  end
end