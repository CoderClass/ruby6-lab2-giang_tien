class User < ApplicationRecord
  has_secure_password

  def image
    self.image_url.presence || "http://1940sswansea.com/wp-content/uploads/2015/11/ghost.png"
  end
end
