module StatusesHelper

  def status_time_presenter(status)
    time = distance_of_time_in_words(status.created_at, Time.now)
    "#{time} ago"
  end

  
  def status_message_helper(status)
    # unless s.statuses.last.message.nil?
    #   s.statuses.last.message
    # else
    #   "Unknown"
    # end
    # unless status.message.blank?
    #   status.message
    # else
    #   "Unknown"
    # end
    status.message ? status.message : ""
  end
end
