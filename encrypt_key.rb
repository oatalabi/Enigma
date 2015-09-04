class Encrypt_key
  def rotation(key, date)
    sqr = date.to_i ** 2
    unique = []
    offsets = sqr.to_s.split("").last(4).join("")
    keys = key.split("").join("")
    unique[0] = keys[0..1].to_i + offsets[0].to_i
    unique[1] = keys[1..2].to_i + offsets[1].to_i
    unique[2] = keys[2..3].to_i + offsets[2].to_i
    unique[3] = keys[3..4].to_i + offsets[3].to_i
    unique
  end
end