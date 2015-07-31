Gem::Specification.new do |s|
  s.name        = 'neurio'
  s.version     = '0.0.2'
  s.date        = '2015-07-31'
  s.summary     = 'Neurio API'
  s.description = 'API functionality for Neurio energy monitoring devices.  See http://neur.io/'
  s.authors     = ['Joe Francis']
  s.email       = 'joe@lostapathy.com'
  s.files       = ['lib/neurio.rb']
  s.homepage    = 'http://rubygems.org/gems/neurio'
  s.license     = 'MIT'
  
  s.require_paths = ['lib']
  
  s.add_runtime_dependency 'httparty', '~> 0.13'
  s.add_development_dependency 'yard', '~> 0.8'
  s.add_development_dependency 'redcarpet', '~> 3.3'
end