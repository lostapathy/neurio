class Neurio
  class Reading
    attr_reader :consumption_power, :consumption_energy, :timestamp
    def initialize(values)
      @timestamp = DateTime.parse(values["timestamp"]).to_time
      @consumption_power = values["consumptionPower"]
      @consumption_energy = values["consumptionEnergy"]
    end
  end
end
