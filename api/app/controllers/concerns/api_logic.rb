class ApiLogic < Logic::Base
  def show
    @response[:key] = nil
    Rails.logger.debug(@json["safe_number"])
    raise ActionError.new('4000') if @json["safe_number"].blank?
    decryptionKey = DecryptionKey.find_by(safe_number: @json["safe_number"])
    @response[:key] = decryptionKey.key if !decryptionKey.nil?
  end
  def create
    Rails.logger.debug(@json[:safe_number])
    Rails.logger.debug(@json[:key])
    raise ActionError.new('4000') if @json[:safe_number].blank?
    raise ActionError.new('4000') if @json[:key].blank?
    decryptionKey = DecryptionKey.new()
    decryptionKey.safe_number = @json[:safe_number]
    decryptionKey.key = @json[:key]
    if decryptionKey.save!
      raise ActionError.new('4001') 
    end
  end
  def wrong
    raise ActionError.new('5000')
  end
end
