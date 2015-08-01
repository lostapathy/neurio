class Neurio
  # A single Neurio sensor reading
  #
  # @attr_reader consumption_power [FixNum] The instantaneous power consumption, in watts
  # @attr_reader consumption_energy [FixNum] The cumulative power consumption since the sensor was activated, in joules
  # @attr_reader timestamp [Time] The timestamp of the sensor reading
  # @attr_reader sensor_id [String] The Neurio sensorId of the sensor
  class Reading
    attr_accessor :consumption_power, :timestamp, :consumption_energy, :sensor_id
    
    def initialize(values, sensor_id)
      @timestamp = DateTime.parse(values["timestamp"]).to_time
      @consumption_power = values["consumptionPower"]
      @consumption_energy = values["consumptionEnergy"]
      @sensor_id = sensor_id
    end
  end
end
