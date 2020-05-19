class HarryPotterService
  def order_of_phoenix_from(house)
    params = params = {'orderOfThePhoenix' => 'true', 'house' => house}
    parsed_json('characters', params)
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
