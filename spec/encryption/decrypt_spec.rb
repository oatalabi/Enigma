require 'spec_helper'
require './decrypt'

describe Decrypt do  
  it "decrypts a meassage using key and date" do
    key = "14168"
    date = "300815"
    @d = Decrypt.new
    message = "seyi is here..end.."
    decrypted = @d.decrypt_message(" iddpm 5zi9,qcwivcq", key, date )
    expect(decrypted).to eql(message)
  end
end