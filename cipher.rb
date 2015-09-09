require_relative 'characters.rb'

class CipherRotation
  def initialize
    @characters = Characters.new
  end
  
  def cipher(rotation)
    rotated_characters = @characters.character_map.rotate(rotation)
    Hash[@characters.character_map.zip(rotated_characters)]
  end
end