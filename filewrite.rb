require_relative 'helper.rb'

class FileWrite
  include ::Enigma::Helper

  def write_message(newfilename, message)
    if File.file?(newfilename)
      put_message("File already exists, Enter a to overwrite or b to enter new target file")
      user_option = STDIN.gets.chomp
      if user_option == "a"
        filename = newfilename
      elsif user_option == "b"
        put_message("Enter a new file name")
        filename = STDIN.gets.chomp
      end
    else
      filename = newfilename
    end
    out = File.open(filename, "w")
    out.write(message)
    out.close
    filename
  end
end