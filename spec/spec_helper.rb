lib_path = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
$: << lib_path unless $:.include?(lib_path)

require 'rspec'
require 'humanhash'
