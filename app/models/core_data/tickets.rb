module CoreData
  class Tickets
    
    def initialize(json)
      @json = json
    end
    
    def primary_tickets
      @json['primary_tickets'] || []
    end

    def reseller_tickets
      @json['reseller_tickets'] || []
    end
    
  end
end

