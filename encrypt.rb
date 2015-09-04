require_relative 'encrypt_key.rb'
require_relative 'cipher.rb'

class Encrypt
  def initialize
    @transform = Encrypt_key.new
    @cipher_rotate = CipherRotation.new
  end

  def encrypt_message(string, key, date)
    letters = string.downcase.split("")
    index = 0
    rotation = @transform.rotation(key, date)
    results = []
    for x in letters
      index = 0 if index > 3
      rot = (@cipher_rotate.cipher(rotation[index])[x])
      if rot
        results << rot
      else
        results << x
      end
      index +=1
    end
    results.join
  end

end