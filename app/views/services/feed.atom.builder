atom_feed do |feed|
  feed.title "#{@service.name} Status Updates"
  @statuses.each do |status|
    feed.entry status do |entry|
      entry.title status.name
      # entry.time  status.created_at
      entry.message status.message
    end
  end
end