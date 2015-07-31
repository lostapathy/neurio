Gem::Specification.new do |s|
  s.name        = 'neurio'
  s.version     = '0.0.0'
  s.date        = '2015-07-31'
  s.summary     = "Neurio API"
  s.description = "API functionality for Neurio energy monitoring devices.  See http://neur.io/"
  s.authors     = ["Joe Francis"]
  s.email       = 'joe@lostapathy.com'
  s.files       = ["lib/neurio.rb"]
  s.homepage    = 'http://rubygems.org/gems/neurio'
  s.license     = 'MIT'
  
  s.add_runtime_dependency 'httparty', '~> 0.13', '>= 0.13.5'
end