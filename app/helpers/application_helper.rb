module ApplicationHelper
  def user_avatar(user, options = {})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag gravatar_url, { alt: user.name }.merge(options)
  end
end
