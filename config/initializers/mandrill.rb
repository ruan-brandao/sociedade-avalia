require 'mandrill'

MANDRILL::API.new ENV['MANDRILL_APIKEY']