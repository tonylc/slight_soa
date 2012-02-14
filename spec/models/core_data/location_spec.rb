require 'spec_helper'

module CoreData
  describe Location do
    subject { Location.new("id" => "5", "name" => "London") }
    its(:id) { should == 5 }
    its(:name) { should == "London" }
  end
end
