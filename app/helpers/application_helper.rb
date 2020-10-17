module ApplicationHelper

  def gravatar_for(user, options = { size: 80 })
    email_address = user.email
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(url, alt: user.username, class: "mt-3 rounded shadow mx-auto d-block")
  end

  

  
end
