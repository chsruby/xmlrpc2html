require 'rubygems'
require 'sinatra'
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')
require 'helpers.rb'
require 'generate.rb'
require 'xmlrpc_setup.rb'

Xmlrpc2Html::Setup.setup do
  # Tried using load here but it didn't seem to do the right thing
  eval File.read File.dirname(__FILE__) + '/config.rb'
end
