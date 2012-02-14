class Forgery::Model < Forgery
  def self.id(options={})
    Forgery(:basic).number(:as_least => 1000, :at_most => 9999)
  end
end
