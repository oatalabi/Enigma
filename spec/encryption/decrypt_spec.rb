require 'spec_helper'
require './decrypt'

describe Decrypt do  
  it "decrypts a meassage using key and date" do
    @d = Decrypt.new
    message = "seyi is here..end.."
    decrypted = @d.decrypt_message(" iddpm 5zi9,qcwivcq", "14168", "300815")
    expect(decrypted).to eql(message)
  end
end