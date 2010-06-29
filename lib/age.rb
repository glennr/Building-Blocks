module Age
  def age(dob)
    unless dob.nil?
      a = Date.today.year - dob.year
      b = Date.new(Date.today.year, dob.month, dob.day)
      a = a-1 if b > Date.today
      return a
    end
    nil
  end
end