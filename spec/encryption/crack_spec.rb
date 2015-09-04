require 'spec_helper'
require './crack'

describe CrackMessage do

  it "cracks a file using date" do
    @c = CrackMessage.new
    date = "040915"
    text = "u9.bjfzt,96y,3"

    file = File.open("encrypted.txt", "w")
    file.write(text)
    file.close

    @c.crack("encrypted.txt", "new.txt", date)
    expect(File.exist?("new.txt")).to be true 
    expect(File.open("new.txt", "r").read).to eql("testing..end.. with key 72955")
    File.delete('encrypted.txt')
    File.delete('new.txt')
  end
end