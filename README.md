# neurio

This gem provides a lightweight wrapper for the API of the Neurio energy monitoring device.

## Examples

Basic usage example to return sensor readings in 15-second batches.

```ruby
n = Neurio.new(:client_id => YOUR_CLIENT_ID, :client_secret => YOUR_CLIENT_SECRET)

last_time = Time.now - 60 # Start with 60 seconds of history

while true do
  readings = n.live(last_time)
  last_time = readings.first.timestamp
  readings.reverse! # API returns results in reverse order
  (0..(readings.size-1)).each do |i|
    puts "#{readings[i].timestamp} - #{readings[i].consumption_power}"
  end
  sleep(15)
end
```
