require 'sinatra'
require 'redis'

$redis = Redis.new(:url => ENV['REDIS_URL'])

class Tentacles < Sinatra::Application
  get '/get' do
    domain = params[:domain]
    $redis.get(domain)
  end

  get '/set' do
    domain = params[:domain]
    endpoint = params[:endpoint]
    $redis.set(domain, endpoint)
  end

  get '/del' do
    domain = params[:domain]
    $redis.del(domain)
    200
  end
end
