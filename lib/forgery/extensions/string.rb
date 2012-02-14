class String
  def to_date
    gsub(/YYYY/) {
        Kernel.rand(2) + 2009
      }.gsub(/MM/) {
        temp_str = (Kernel.rand(12) + 1).to_s
        temp_str = "0" + temp_str if temp_str.to_i < 10
        temp_str
      }.gsub(/DD/) {
        temp_str = (Kernel.rand(28) + 1).to_s
        temp_str = "0" + temp_str if temp_str.to_i < 10
        temp_str
      }.gsub(/HH/) {
        temp_str = (Kernel.rand(23) + 1).to_s
        temp_str = "0" + temp_str if temp_str.to_i < 10
        temp_str
      }.gsub(/MM/) {
        temp_str = (Kernel.rand(59) + 1).to_s
        temp_str = "0" + temp_str if temp_str.to_i < 10
        temp_str
      }.gsub(/SS/) {
        temp_str = (Kernel.rand(59) + 1).to_s
        temp_str = "0" + temp_str if temp_str.to_i < 10
        temp_str
      }
  end
end
