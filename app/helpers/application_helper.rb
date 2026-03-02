module ApplicationHelper
  def owner?(resource)
    user_signed_in? && current_user == resource.user
  end

  def gravatar_for(user, size: 80)
    hash = Digest::MD5.hexdigest(user.email.downcase)
    url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(url, alt: user.email, class: "gravatar")
  end
end
