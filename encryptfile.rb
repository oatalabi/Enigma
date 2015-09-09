require_relative 'helper.rb'
require_relative 'fileopen.rb'
require_relative 'filewrite.rb'
require_relative 'encrypt.rb'
require_relative 'today.rb'

class EncryptFile
include ::Enigma::Helper
  def initialize
    @encrypt = Encrypt.new
    @file_open = FileOpen.new
    @write_into_file = FileWrite.new
    @today = Today.new
  end

  def encrypt_file(filename, newfilename)
    key = rand(10000..99999).to_s
    text = @file_open.read_message(filename)
    date = @today.date
    encrypted =  @encrypt.encrypt_message(text, key, date)
    file = @write_into_file.write_message(newfilename, encrypted)
    put_message("Created '#{file}' with the key #{key} and date #{date}")
  end
end

if ARGV.length == 2
  files = ARGV.each { |file| file }
  EncryptFile.new.encrypt_file(ARGV[0], ARGV[1])
else
  puts "Please provide two text files, One with the message and One for encryption"
end