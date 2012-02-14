module CoreData
  describe Venue do
    subject {
      Venue.new({"name" => "Logan Hall", "id" => "64130", "location_id" => "24426", "postal_code" => "N1 6NG", "street_address" => "123 street address"})
    }

    its(:id) { should == 64130 }
    its(:location_id) { should == 24426 }
    its(:name) { should == "Logan Hall" }
    its(:street_address) { should == "123 street address" }
    its(:postal_code) { should == "N1 6NG"}
  end
end


