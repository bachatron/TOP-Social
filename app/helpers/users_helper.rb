module UsersHelper
  def avatar_for(user, size: 40, **options)
    options[:class] = [ options[:class], "avatar" ].compact.join(" ")

    if user.avatar.attached?
      image_tag user.avatar.variant(resize_to_fill: [ size, size ]), **options
    else
      gravatar_for(user, size: size, **options)
    end
  end
end
