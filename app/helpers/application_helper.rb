module ApplicationHelper
  def url_for_github(user)
    "https://github.com/#{user.nickname}"
  end
end
