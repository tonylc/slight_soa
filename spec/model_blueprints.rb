# try to keep in alphabetical order (easier to find...)
class Object
  def self.blueprint
    result = yield
    self.to_s.constantize.module_eval("def self.blueprint_defined() #{result.inspect} end")
  end

  def self.new_mock(overriding_data = {})
    self.new(self.mock_json(overriding_data))
  end

  def self.mock_from_backend(*args)
    json_hash = self.mock_json(args.extract_options!)
    args << json_hash
    self.from_backend(*args)
  end

  def self.mock_json(overriding_data = nil)
    default_json = self.blueprint_defined
    return default_json unless overriding_data.present?

    if default_json.is_a?(Hash)
      default_json.merge!(overriding_data)
    else
      default_json = overriding_data
    end
    default_json
  end
end

# need to move slice up because other blueprints depend on Slice
CoreData::Event.blueprint do
  {
    "date" => Forgery(:date).date("YYYY/MM/DD"),
    "id" => Forgery(:model).id,
    "venue_id" => Forgery(:model).id,
    "metro_area_id" => Forgery(:model).id,
    "artist_ids" => [Forgery(:model).id],
    "primary_tickets" => [{"price" => nil, "url" => "/tickets/5079591", "vendor_name" => "We Got Tickets", "on_sale_date" => nil}],
    "past_event" => false,
    "reseller_tickets" => [{"price" => nil, "url" => "/tickets/5079591", "vendor_name" => "We Got Tickets", "on_sale_date" => nil}]
  }
end

CoreData::Location.blueprint do
  {
    "name" => Forgery(:name).full_name,
    "id" => Forgery(:model).id
  }
end

CoreData::Tickets.blueprint do
  {
    "primary_tickets" => [
      {
        "ticket_vendor_image_url" => "media\/img\/original\/20110404-104527-014399.png",
        "maximum_price" => 55.0,
        "minimum_price" => 40.0,
        "ticket_vendor_name" => "Eventim UK",
        "url" => "http://www.eventim.co.uk/tickets.html?affiliate=SGK&fun=evdetail&doc=evdetailb&key=527035$1334508",
        "status" => "sold_out",
        "currency_code" => "GBP",
        "on_sale_date" => "2011/01/28"
      }
    ]
  }
end

CoreData::Venue.blueprint do
  {
    "name" => Forgery(:name).full_name,
    "id" => Forgery(:model).id,
    "location_id" => Forgery(:model).id
  }
end
