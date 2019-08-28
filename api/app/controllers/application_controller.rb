require 'json'
class ApplicationController < ActionController::API

  include Common
  SystemErrorJson = { code: '9999' }
  rescue_from Exception, with: -> e {
    print_error e
    render json: SystemErrorJson, status: 500
  }
  def show
    render json: ApiLogic.new(JSON.parse("{\"safe_number\":\"#{params[:safe_number]}\"}")).execute('show').to_json
  end
  def create
    render json: ApiLogic.new(JSON.parse(request.body.read)).execute('create').to_json
  end

  #if wrong routes
  def wrong
    render  json: ApiLogic.new(JSON.parse("{}")).execute('wrong').to_json
  end
end
