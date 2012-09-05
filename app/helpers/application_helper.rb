module ApplicationHelper

  # def date_presenter
  #   content = []
  #   (1..6).each do |x|
  #     content << "%th (#{Date.today - x}).strftime(\"%A. %d\")"
  #     content
  #   end
  # end

  def date_presenter
    contents = []
    content_tag :th do
      (1..6).each do |x|
        contents << (Date.today - x).strftime("%a. %d")
        contents
      end
    end
  end
end
