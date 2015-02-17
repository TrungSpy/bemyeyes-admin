module TheLogger
  def self.log
    @log ||= Rails.logger
  end
end
