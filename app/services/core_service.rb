class CoreService < AbstractService
  def get_artist(artist_id, options={})
    get("/artists/#{artist_id}", options) { |data| CoreData::Artist.new(data) }
  end

  def get_event(event_id)
    get("/events/#{event_id}") { |data| CoreData::Event.new(data) }
  end

  def get_events_for_artist(artist_id, type, page)
    get("/artists/#{artist_id}/calendar", :page => page, :type => type) { |r| r.map {|e| CoreData::Event.new(e) } }
  end

  def get_events_for_location(location_id, type, page)
    get("/metro_areas/#{location_id}/calendar", :page => page, :type => type) { |r| r.map {|e| CoreData::Event.new(e) } }
  end

  def get_events_for_venue(venue_id, type, page)
    get("/venues/#{venue_id}/calendar", :page => page, :type => type) { |r| r.map {|e| CoreData::Event.new(e) } }
  end

  def get_location(location_id, options={})
    get("/metro_areas/#{location_id}", options) { |data| CoreData::Location.new(data) }
  end

  def get_tickets_for_event(event_id)
    get("/events/#{event_id}/tickets") { |data| CoreData::Tickets.new(data) }
  end

  def get_venue(venue_id, options={})
    get("/venues/#{venue_id}", options) { |data| CoreData::Venue.new(data) }
  end

  def create_event(user_id, date, artist_ids, venue_id, state)
    post("/events", {:user_id => user_id, :date => date, :artist_ids => artist_ids, :venue_id => venue_id, :state => state})
  end

  def domain
    "slight-core"
  end
end
