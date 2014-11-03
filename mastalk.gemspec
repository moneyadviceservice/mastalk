Gem::Specification.new do |s|
  s.name        = 'mastalk'
  s.version     = '0.1.1'
  s.date        = '2014-10-31'
  s.summary     = 'mastalk'
  s.description = 'Mastalk markdown extension language'
  s.authors     = ['Douglas Roper']
  s.email       = 'dougdroper@gmail.com'
  s.files       = ['lib/mastalk.rb']
  s.homepage    =
    'http://rubygems.org/'
  s.license       = 'MIT'

  s.add_runtime_dependency 'kramdown', '~> 1.5.0', '>= 1.5.0'
  s.add_development_dependency 'rspec', '~> 3.1.0', '>= 3.1.0'
  s.add_development_dependency 'rake', '~> 10.3.2', '>= 10.3.2'
end
