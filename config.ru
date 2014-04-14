require './tentacles'

use Rack::ShowExceptions

run Tentacles.new
