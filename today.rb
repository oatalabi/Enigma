class Today
  def date
    time = Time.now
    time.strftime("%d%m%y")
  end
end