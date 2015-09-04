require_relative 'helper.rb'

class FileWrite
  include ::Enigma::Helper

  def into(newfilename, message)

    if File.file?(newfilename)
      put_message("File already exists, Enter a to overwrite or b to enter new target file")
      option = STDIN.gets.chomp
      if option == "a"
        filename = newfilename
      elsif option == "b"
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