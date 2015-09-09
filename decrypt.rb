require_relative 'rotator_generator.rb'
require_relative 'cipher.rb'

class Decrypt
  def initialize
    @rotator_generator = RotatorGenerator.new
    @cipher_rotate = CipherRotation.new
  end

  def decrypt_message(string, key, date)
    letters = string.downcase.split("")
    index = 0
    rotation_array = @rotator_generator.rotator(key, date)
    results = []
    for letter in letters
      index = 0 if index > 3
      rotated_letter = (@cipher_rotate.cipher(-rotation_array[index])[letter])
      if rotated_letter
        results << rotated_letter
      else
        results << letter
      end
      index += 1
    end
    results.join
  end

end