class HarryPotterService
  def order_of_phoenix_from(house)
    find_house('Gryffindor')
    require 'pry'; binding.pry
    # require 'pry'; binding.pry
  end

  def all_houses
    parsed_json('houses')
  end

  def find_house(house)
    all_houses.find do |house_info|
      house_info[:name] = house.capitalize
    end
  end

  private

  def connect
    Faraday.new('https://www.potterapi.com/v1') do |req|
      req.params['key'] = ENV['HP_KEY']
    end
  end

  def parsed_json(url, params = nil)
    res = connect.get(url, params)
    JSON.parse(res.body, symbolize_names: true)
  end
end
