require 'spec_helper'

module CoreData
  describe Artist do
    subject { Artist.new("id" => "5", "name" => "Lupe Fiasco", "imageUrl" => "some.png") }
    its(:id) { should == 5 }
    its(:name) { should == "Lupe Fiasco" }
    its(:image_url) { should == "some.png" }
  end
end
