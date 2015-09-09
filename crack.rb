require_relative 'decrypt.rb'
require_relative 'fileopen.rb'
require_relative 'decryptfile.rb'
require_relative 'helper.rb'

class CrackMessage
  include ::Enigma::Helper

  def initialize
    @decrypt = Decrypt.new
    @file_open = FileOpen.new
    @decrypt_file = DecryptFile.new
  end

  def crack(encrypted_file, crackfile, date)
    text = @file_open.read_message(encrypted_file)
    text_size = text.size
    last_text_index = (text_size % 4) + 8
    last_letters = text[(text_size - last_text_index)..text_size]
    found_key = obtain_key(last_letters, date)
    create_decrypted_file(encrypted_file, crackfile, found_key, date)
  end

  private

  def obtain_key(last_letters, date)
    key_found = ""
    (10000..99999).each do |key|
      key = key.to_s
      decrypted = @decrypt.decrypt_message(last_letters, key, date)
      if decrypted.end_with? "..end.."
        key_found = key
        break
      end
    end
    key_found
  end

  def create_decrypted_file(encrypted_file, crackfile, found_key, date)
    @decrypt_file.decrypt_file(encrypted_file, crackfile, found_key, date)
  end
end

if ARGV.length == 3
  files = ARGV.each { |file| file }
  CrackMessage.new.crack(ARGV[0], ARGV[1], ARGV[2])
else
  puts "Please provide three arguments, two text files and the date for cracking"
end