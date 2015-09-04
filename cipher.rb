require_relative 'characters.rb'

class CipherRotation
  def initialize
    @char = Characters.new
  end
  
  def cipher(rotation)
    rotated_characters = @char.map.rotate(rotation)
    Hash[@char.map.zip(rotated_characters)]
  end
end