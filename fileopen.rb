class FileOpen
  def read(filename)
    input = File.open(filename, "r")
    text = input.read
  end
end