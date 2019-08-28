module Logic
  class Base
    include Common
#    Checker = {
#      email:           { code: '4003', regex: /\A[a-zA-Z0-9\.\!#\$%&'\*\+\/=\?\^_`\{\|\}~\-]+@[a-zA-Z0-9\-]+(?:\.[a-zA-Z0-9\-]+)*\z/i },
#      password:        { code: '4004', regex: /\A[a-zA-Z0-9_\-\?\!\+\*\[\]\/]{8,}\z/i },
#    }
    def initialize json
      @json = json
      @response = ActionResponse.new
    end
    def execute key
      begin
        method(key).call
      rescue NameError => ne
        Rails.logger.error "Called: #{ne.message}"
        Rails.logger.error(ne.backtrace.join(?\n))
        @response.status = 500
        @response.error(ne.message)
      rescue ActionError => ae
        Rails.logger.error "Action: #{ae.message}"
        @response.status = 500
        @response.error(ae.code)
	Rails.logger.debug(@response.status)
      rescue Exception => e
        Rails.logger.error "Fatal: #{e.message}"
        @response.status = 500
        @response.error(e.message)
        print_error e
        raise e
      end
      @response
    end
#    def check key
#      c = Checker[key]
#      raise ActionError.new(c[:code]) if c[:regex] !~ @json[key]
#    end
  end
end
