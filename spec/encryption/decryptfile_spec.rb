require 'spec_helper'
require './decryptfile'

describe DecryptFile do

  it "decrypts a meassage using key and date" do
    @e = DecryptFile.new
    date = "040915"
    text = "u9.bjfzt,96y,3"
    key = "72955"

    file = File.open("encrypted.txt", "w")
    file.write(text)
    file.close

    @e.decrypt("encrypted.txt", "decrypted.txt", key, date)
    expect(File.exist?("decrypted.txt")).to be true 
    expect(File.open("decrypted.txt", "r").read).to eql("testing..end.. with key 72955")
    File.delete('decrypted.txt')
    File.delete("encrypted.txt")
  end
end