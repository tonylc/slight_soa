require 'spec_helper'

describe CoreService do
  let(:backend) { BackendClient.new("slight-core-data") }
  let(:core_service) { CoreService.new(backend) }

  it "should get an artist" do
    backend.should_receive(:do_request).with(:get, "/artists/8").and_return({})
    core_service.get_artist(8)
  end

  it "should get an event" do
    backend.should_receive(:do_request).with(:get, "/events/1").and_return({})
    core_service.get_event(1)
  end

  it "should get a location" do
    backend.should_receive(:do_request).with(:get, "/metro_areas/5").and_return({})
    core_service.get_location(5)
  end

  it "should get a venue" do
    backend.should_receive(:do_request).with(:get, "/venues/5").and_return({})
    core_service.get_venue(5)
  end

  it "should get events for a venue" do
    backend.should_receive(:do_request).with(:get, "/venues/5/calendar", :page => 1, :type => "upcoming").and_return([{}])
    core_service.get_events_for_venue(5, 'upcoming', 1)
  end

  it "should get events for an artist" do
    backend.should_receive(:do_request).with(:get, "/artists/5/calendar", :page => 1, :type => "upcoming").and_return([{}])
    core_service.get_events_for_artist(5, 'upcoming', 1)
  end

  it "should get events for a location" do
    backend.should_receive(:do_request).with(:get, "/metro_areas/5/calendar", :page => 1, :type => "upcoming").and_return([{}])
    core_service.get_events_for_location(5, 'upcoming', 1)
  end

  it "should create an event" do
    backend.should_receive(:do_request).
      with(:post, "/events", {:user_id => '4', :date => '2011-02-02', :artist_ids => '1,2', :venue_id => '3', :state => 'form'}).
      and_return({})
    core_service.create_event('4', '2011-02-02', '1,2', '3', 'form')
  end
end
