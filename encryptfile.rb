require_relative 'helper.rb'
require_relative 'fileopen.rb'
require_relative 'write.rb'
require_relative 'encrypt.rb'
require_relative 'today.rb'

class EncryptFile
include ::Enigma::Helper
  def initialize
    @encrypt = Encrypt.new
    @open = FileOpen.new
    @write = FileWrite.new
    @today = Today.new
  end

  def encrypt_file(filename, newfilename)
    key = rand(10000..99999).to_s
    text = @open.read(filename)
    date = @today.date
    encrypted =  @encrypt.encrypt_message(text, key, date)
    file = @write.into(newfilename, encrypted)
    put_message("Created '#{file}' with the key #{key} and date #{date}")
  end
end

if ARGV.length == 2
  files = ARGV.each { |file| file }
  EncryptFile.new.encrypt_file(ARGV[0], ARGV[1])
else
  puts "Please provide two text files, One with the message and One for encryption"
end