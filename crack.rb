require_relative 'decrypt.rb'
require_relative 'fileopen.rb'
require_relative 'decryptfile.rb'
require_relative 'helper.rb'

class CrackMessage
  include ::Enigma::Helper

  def initialize
    @decrypt = Decrypt.new
    @open = FileOpen.new
    @decrypt_file = DecryptFile.new
  end

  def crack(encrypted_file, crackfile, date)
    text = @open.read(encrypted_file)
    s = text.size
    m = (s % 4) + 8
    last = text[s-m..s]
    decrypted = ""
    (10000..99999).each do |i|
      i = i.to_s
      decrypted = @decrypt.decrypt_message(last, i, date)
      if decrypted.end_with? "..end.."
        put_message("key found")
        @decrypt_file.decrypt(encrypted_file, crackfile, i, date)
        break
      end
    end
  end

end

if ARGV.length == 3
  files = ARGV.each { |file| file }
  CrackMessage.new.crack(ARGV[0], ARGV[1], ARGV[2])
else
  puts "Please provide three arguments, two text files and the date for cracking"
end