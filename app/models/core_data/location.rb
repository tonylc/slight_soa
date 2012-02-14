module CoreData
  class Location
    def initialize(data)
      @data = data
    end

    def id
      @data['id'].to_i
    end

    def name
      @data['name']
    end
  end
end
