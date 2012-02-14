require 'spec_helper'

module CoreData
  describe Event do
    subject {
      Event.new({"date" => "2011/1/1",
        "id" => "124",
        "venue_id" => "235",
        "metro_area_id" => "2252"})
    }

    its(:date) { should == Date.new(2011,1,1) }
    its(:id) { should == 124 }
    its(:venue_id) { should == 235 }
    its(:metro_area_id) { should == 2252 }
  end
end
