module Common
  def print_error e
    messages = [e.class.to_s]
    messages << "DateTime: #{Time.now.strftime('%Y-%m-%d %H:%M:%S.%6N')}"
    messages << "Message: #{e.message}"
    messages << "StackTrace: \n[code]#{e.backtrace.select{|t|/\A\/home/=~t}.join(?\n)}[/code]"
    message = messages.join(?\n)
    Rails.logger.error "#{?**10} -=EXCEPTION=- #{?**10}\n#{message}"
  end
end
