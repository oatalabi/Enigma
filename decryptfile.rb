require_relative 'helper.rb'
require_relative 'fileopen.rb'
require_relative 'write.rb'
require_relative 'decrypt.rb'

class DecryptFile
include ::Enigma::Helper
  def initialize
    @decrypt = Decrypt.new
    @open = FileOpen.new
    @write = FileWrite.new
  end

  def decrypt(filename, newfilename, key, date)
    text = @open.read(filename)
    decrypted = @decrypt.decrypt_message(text, key, date)
      file = @write.into(newfilename, "#{decrypted} with key #{key}")
      put_message("Created '#{file}' with the key #{key} and date #{date}")
  end
end

if ARGV.length == 4
  files = ARGV.each { |file| file }
  DecryptFile.new.decrypt(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
else
  puts "Please provide four arguments, two text files, the key and date for decryption"
end