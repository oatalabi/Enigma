require 'spec_helper'
require './encryptfile'

describe EncryptFile do

  it "encrypts a meassage using key and date" do
    @e = EncryptFile.new
    text = "testing..end.."

    file = File.open("test.txt", "w")
    file.write(text)
    file.close

    @e.encrypt_file("test.txt", "encrypted.txt")
    expect(File.file?("encrypted.txt")).to be true 
    File.delete('test.txt')
    File.delete('encrypted.txt')
  end

end