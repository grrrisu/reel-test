require 'bundler/setup'
require 'celluloid/current'
Bundler.require :default

require_relative 'web_server'

WebServer.run
