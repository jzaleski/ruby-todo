module AuthenticationHelper
  def encrypt_password(password)
    Digest::SHA1.hexdigest(password)
  end
end
