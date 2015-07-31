class Neurio
  class Reading
    attr_reader :consumption_power, :consumption_energy, :timestamp, :sensor_id
    def initialize(values, sensor_id)
      @timestamp = DateTime.parse(values["timestamp"]).to_time
      @consumption_power = values["consumptionPower"]
      @consumption_energy = values["consumptionEnergy"]
      @sensor_id = sensor_id
    end
  end
end
