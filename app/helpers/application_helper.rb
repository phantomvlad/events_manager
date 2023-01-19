module ApplicationHelper
  def user_avatar(user,variant)
    if user.avatar?
      user.avatar.variant(variant)
    else
      asset_path('avatar.png')
    end
  end

  def bi_icon(icon_class)
    content_tag 'i', '', class: "bi bi-#{icon_class}"
  end
end
