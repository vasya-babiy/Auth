module Authorization  

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def authenticate(email, password)
      user = find_by_email(email)
      if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      else
        nil
      end
    end

    def authenticate_admin(email, password)
      admin = find_by_email(email)
      if admin && admin.password_hash == BCrypt::Engine.hash_secret(password, admin.password_salt)
        admin
      else
        nil
      end
    end
  end

  def encrypt_password
    if password.present?
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end