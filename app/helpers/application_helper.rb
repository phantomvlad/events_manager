module ApplicationHelper
  def user_avatar(user,variant)
    if user.avatar.attached?
      user.avatar.variant(variant)
    else
      asset_path('avatar.png')
    end
  end

  def event_photo(event,variant)
    if event.photo.attached?
      url_for(event.photo.variant(variant))
    else
      asset_path('event-back.jpg')
    end
  end

  def bi_icon(icon_class)
    content_tag 'i', '', class: "bi bi-#{icon_class}"
  end
end
