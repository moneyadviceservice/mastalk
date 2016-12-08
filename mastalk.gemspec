lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'mastalk'
  s.version     = '0.8.1'
  s.summary     = 'mastalk'
  s.description = 'Mastalk markdown extension language'
  s.authors     = ['Douglas Roper', 'Justin Perry']
  s.email       = 'dougdroper@gmail.com'
  s.files       = `git ls-files`.split($/)
  s.homepage    = 'https://github.com/moneyadviceservice/mastalk'
  s.license       = 'MIT'

  s.add_runtime_dependency 'kramdown', '~> 1.13', '>= 1.13'
  s.add_runtime_dependency 'htmlentities', '~> 4.3.2', '>= 4.3.2'
  s.add_development_dependency 'rspec', '~> 3.1.0', '>= 3.1.0'
  s.add_development_dependency 'rake', '~> 10.3.2', '>= 10.3.2'
end
