module CoreData
  class Artist
    def initialize(data)
      @data = data
    end

    def id
      @data['id'].to_i
    end

    def image_url
      @data['imageUrl']
    end

    def name
      @data['name']
    end
  end
end
