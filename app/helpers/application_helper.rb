module ApplicationHelper
  def owner?(resource)
    user_signed_in? && current_user == resource.user
  end
end
