require 'date'

class Forgery::Date < Forgery
  def self.date(date_fmt=nil)
    if date_fmt
      val = formats[:date].find {|fmt| fmt==date_fmt}
      val.to_date
    else
      formats[:date].random.to_date
    end
  end
end
