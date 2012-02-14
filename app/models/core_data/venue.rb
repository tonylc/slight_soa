module CoreData
  class Venue
    def initialize(json)
      @json = json
    end

    def id
      @json['id'].to_i
    end

    def lat
      @json['lat'].to_f
    end

    def lng
      @json['lng'].to_f
    end

    def location_id
      @json['location_id'].to_i
    end

    def name
      @json['name']
    end

    def street_address
      @json['street_address']
    end

    def postal_code
      @json['postal_code']
    end
  end
end
