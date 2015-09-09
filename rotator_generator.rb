class RotatorGenerator
  def rotator(key, date)
    date_sqr = date.to_i ** 2
    rotation_offset = []
    date_offsets = date_sqr.to_s.split("").last(4).join("")
    keys = key.split("").join("")
    rotation_offset[0] = keys[0..1].to_i + date_offsets[0].to_i
    rotation_offset[1] = keys[1..2].to_i + date_offsets[1].to_i
    rotation_offset[2] = keys[2..3].to_i + date_offsets[2].to_i
    rotation_offset[3] = keys[3..4].to_i + date_offsets[3].to_i
    rotation_offset
  end
end