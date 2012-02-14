require 'spec_helper'

describe BackendClient do
  let(:backend) { BackendClient.new("www.google.com") }

  describe "#do_request" do
    it "should do a get request to http://www.google.com/we/own/you" do
      FakeWeb.register_uri(:get, "http://www.google.com/we/own/you", :code => "200", :body => "{\"a\":1}")
      backend.do_request(:get, "/we/own/you").should == {"a" => 1}
    end

    it "should do a post request with post data to http://www.google.com/we/own/you" do
      FakeWeb.register_uri(:post, "http://www.google.com/we/own/you", :code => "200", :body => "{\"a\":1}")
      backend.do_request(:post, "/we/own/you", "post_data" => true).should == {"a" => 1}
    end

    it "should do a put request with post data to http://www.google.com/we/own/you" do
      FakeWeb.register_uri(:put, "http://www.google.com/we/own/you", :code => "200", :body => "{\"a\":1}")
      backend.do_request(:put, "/we/own/you", "post_data" => true).should == {"a" => 1}
    end

    it "should do a delete request to http://www.google.com/we/own/you" do
      FakeWeb.register_uri(:delete, "http://www.google.com/we/own/you", :code => "200", :body => "{\"a\":1}")
      backend.do_request(:delete, "/we/own/you").should == {"a" => 1}
    end

    describe "error handling" do
      it "should by default raise an error when the status code is not 200" do
        FakeWeb.register_uri(:get, "http://www.google.com", :code => "404", :body => "{}")
        backend.do_request(:get, "/").should raise_error
      end

      it "should ignore errors if the status code is explicitly ignored" do
        FakeWeb.register_uri(:get, "http://www.google.com", :code => "404", :body => "{}")
        backend.do_request(:get, "/", :ignore_codes => [404])
      end
    end
  end
end
