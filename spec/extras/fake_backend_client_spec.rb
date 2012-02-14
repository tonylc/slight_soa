require 'spec_helper'

describe FakeBackendClient do
  let(:fake_backend) { FakeBackendClient.new("some-domain", 3000) }

  describe "#construct_file_path" do
    it "should be constructed based on the uri" do
      fake_backend.construct_file_path("artists/5/locations/4").should =~
        /some_domain\/artists_id_locations_id\.json$/
    end
  end

  it "should raise error if the constructed file path doesn't exist" do
    File.stub(:exist?).with(/some_domain\/artists_id_locations_id\.json$/).and_return(false)
    lambda { fake_backend.do_request("artists/5/locations/4") }.should raise_exception
  end
end
