# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ymaps_coordinates_picker/version'

Gem::Specification.new do |spec|
  spec.name             = 'ymaps_coordinates_picker'
  spec.version       = YmapsCoordinatesPicker::VERSION
  spec.authors       = ["Jurij Rudenko"]
  spec.email         = ["velokoder@gmail.com"]
  spec.summary       = 'works to provide an easy to use Yandex Maps for displaying coordinates picker in forms'
  spec.description   = 'This gem hepls you to create coordinates field using yandex map. Gem supports single and multiple geopoint fields'
  spec.homepage      = ""
  spec.license       = "MIT"
  spec.files         = `git ls-files`.split("\n")  
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")  
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) } 
  spec.require_paths = ['lib', 'lib/ymaps_coordinates_picker']

  spec.add_dependency 'rails', '>= 3.1.0'
end