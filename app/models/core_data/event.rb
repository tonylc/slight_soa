module CoreData
  class Event
    def initialize(json)
      @json = json
    end

    def artist_ids
      @json['artist_ids'].map{|artist_id| artist_id.to_i}
    end

    def date
      Date.parse(@json['date'])
    end

    def id
      @json['id'].to_i
    end

    def metro_area_id
      @json['metro_area_id'].to_i
    end
    
    def metro_area_name
      @json['metro_area_name']
    end

    def past_event?
      @json['past_event']
    end

    def title
      @json['title']
    end
    
    def venue_id
      @json['venue_id'].to_i
    end
    
    def venue_name
      @json['venue_name']
    end
  end
end
