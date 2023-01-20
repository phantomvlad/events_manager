module ApplicationHelper
  def user_avatar(user,variant)
    if user.avatar.attached?
      user.avatar.variant(variant)
    else
      asset_path('avatar.png')
    end
  end

  def event_photo(event)
    photos = event.photos.persisted

    if photos.any?
      url_for(photos.sample.image.variant(:big))
    else
      asset_path('event-back.jpg')
    end
  end

  def event_thumb(event)
    photos = event.photos.persisted

    if photos.any?
      url_for(photos.sample.image.variant(:thumb))
    else
      asset_path('event-back.jpg')
    end
  end

  def event_avatar_thumb(event)
    if event.event_avatar.attached?
      url_for(event.event_avatar.variant(:thumb))
    else
      asset_path('event-back.jpg')
    end
  end

  def event_avatar_big(event)
    if event.event_avatar.attached?
      url_for(event.event_avatar.variant(:big))
    else
      asset_path('event-back.jpg')
    end
  end

  def bi_icon(icon_class)
    content_tag 'i', '', class: "bi bi-#{icon_class}"
  end
end
