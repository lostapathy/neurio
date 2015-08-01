class Neurio
  class Reading
    def initialize(values, sensor_id)
      @timestamp = DateTime.parse(values["timestamp"]).to_time
      @consumption_power = values["consumptionPower"]
      @consumption_energy = values["consumptionEnergy"]
      @sensor_id = sensor_id
    end
    
    # The instantaneous power consumption, in watts
    #
    # @return [FixNum] power consumption
    def consumption_power
      @consumption_power
    end
    
    # The timestamp of the sensor reading
    #
    # @return [Time] reading timestamp
    def timestamp
      @timestamp
    end
    
    # The cumulative power consumption since the sensor was activated, in joules
    #
    # @return [FixNum] Total energy consumed
    def consumption_energy
      @consumption_energy
    end
    
    # The Neurio sensorId for the sensor
    #
    # @return [String] id of the sensor
    def sensor_id
      @sendor_id
    end
    
  end
end
