require 'sinatra/base'
require 'sinatra/respond_with'

class Api < Sinatra::Base
  register Sinatra::RespondWith

  before do
    headers 'Access-Control-Allow-Origin' => '*',
      'Access-Control-Allow-Methods' => %w{ GET },
      'Access-Control-Allow-Headers' => %w{ Content-Type }
  end

  DATA_PATH = File.expand_path("../../../data", __FILE__)

  get '/:doc' do
    content_type 'text/html'
    File.read(File.join(DATA_PATH, params[:doc]))
  end
end
