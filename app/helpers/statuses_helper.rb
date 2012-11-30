module StatusesHelper

  def status_time_presenter(status)
    time = distance_of_time_in_words(status.created_at, Time.now)
    "#{time} ago"
  end

  
  def status_message_helper(status)
    status.message ? status.message : ""
  end
end
