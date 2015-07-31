require 'httparty'

class Neurio
  include HTTParty
  base_uri "https://api.neur.io"
  
  class Reading
    attr_reader :consumption_power, :consumption_energy, :timestamp
    def initialize(values)
      @timestamp = DateTime.parse(values["timestamp"]).to_time
      @consumption_power = values["consumptionPower"]
      @consumption_energy = values["consumptionEnergy"]
    end
  end
  
  # Construct a new Neurio API instance
  #
  # @param options [Hash] configuration options
  # @option options client_id [String] the Neurio client id
  # @option options client_secret [String] the Neurio client secret
  def initialize(options)
    @client_secret = options[:client_secret]
    @client_id = options[:client_id]
    raise ArgumentError.new("client_id and client_secret must be specified") unless @client_secret && @client_id
  end
  
  # Get the most recent sensor reading
  #
  # @param sensor_id [String] The sensor id to retrieve data for
  # @return [Neurio::Reading]
  def last(sensor_id = default_sensor_id)
    headers =  {"content_type" => "application/json", "authorization" => "Bearer #{token}"}
    query = {"sensorId" => sensor_id}
    response = self.class.get("/v1/samples/live/last", :headers => headers, :query => query)
    Reading.new(response)
  end
  

  # Look up the ID of the first (and usually only) sensor associated with this account
  #
  # @return [String] The Neurio sensorId
  def default_sensor_id
    user["locations"][0]["sensors"][0]["sensorId"]
  end
  
  # Get recent sensor readings since last_timestamp.
  #
  # @param last_timestamp [DateTime] Timestamp of last sample already received.  API defaults to 2 minutes ago if omitted.
  # @param sensor_id [String] The sensor id to retrieve data for
  # @return [Array<Neurio::Reading>] Array of sensor readings
  def live(last_timestamp = nil, sensor_id = default_sensor_id)
    headers =  {"content_type" => "application/json", "authorization" => "Bearer #{token}"}
    query = {"sensorId" => sensor_id}
    if last_timestamp
      query["last"] = last_timestamp.iso8601(3)
    end
    
    response = self.class.get("/v1/samples/live", :headers => headers, :query => query)
    response.map{|x| Reading.new(x)}
  end

  private
  # Obtain an API token for this client
  def token
    unless @token
      options = {"grant_type" => "client_credentials", "client_id" => @client_id, "client_secret" => @client_secret}
      response = self.class.post("/v1/oauth2/token", :body => options)
      
      @token = response["access_token"]
    end
    @token
  end
  
  # Obtain a user object associated with the token
  def user
    unless @user
      headers =  {"content_type" => "application/json", "authorization" => "Bearer #{token}"}
      @user = self.class.get("/v1/users/current", :headers => headers)
    end
    @user
  end
  

end
