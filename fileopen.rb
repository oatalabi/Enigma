class FileOpen
  def read_message(filename)
    input = File.open(filename, "r")
    text = input.read
  end
end