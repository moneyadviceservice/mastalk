Gem::Specification.new do |s|
  s.name        = 'mastalk'
  s.version     = '0.0.0'
  s.date        = '2010-04-28'
  s.summary     = 'mastalk'
  s.description = 'mastalk markdown extension language'
  s.authors     = ['Douglas Roper']
  s.email       = 'dougdroper@gmail.com'
  s.files       = ['lib/mastalk.rb']
  s.homepage    =
    'http://rubygems.org/'
  s.license       = 'MIT'

  s.add_runtime_dependency 'kramdown', '~> 1.5.0'
end
