class Errors
  def self.message code
    case code
    when "4000"; "Parameter incorrect."
    when "4001"; "Failed to save key."
#    when "4001"; "Violation of unique constraint."
#    when "4002"; "Interval violation. Please leave enough time."
#    when "4003"; "The effective time has been exceeded. Please retry."
#    when "4004"; "Last transaction has not confirmed."
#    when "5000"; "Session is incorrect or timeout. Please login again."
#    when "5001"; "Invalid user. Please contact support."
#    when "5002"; "Authentication is not done yet."
    when "5000"; "URL incorrect"
    else
      "API Server error. Please wait a moment."
    end
  end
end