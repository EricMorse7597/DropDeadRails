module UsersHelper
  def gravatar_for(user, options = { size: 80 })
    size = options[:size]
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag('default_profile.png', alt: user.name, class: 'gravatar', width: size.to_s + 'px')
  end
end
