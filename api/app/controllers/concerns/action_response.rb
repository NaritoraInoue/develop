class ActionResponse
  Success = '0000'
  attr_accessor :status
  def initialize
    @status = 200
    @json = { code: Success }
  end
  def status
    @status
  end
  def status= code
    @status = code.to_i
    @json[:code] = '9999' if 500 == @status
  end
  def [](indexer)
    @json[indexer]
  end
  def []=(indexer, value)
    @json[indexer] = value
  end
  def error code
    @json[:message] = Errors.message(@json[:code] = $1) if /(\d{4})/ =~ code.to_s
  end
  def error?
    Success != @json[:code]
  end
  def to_json
    JSON.generate(@json)
  end
  def to_pretty
    JSON.pretty_generate(@json)
  end
end