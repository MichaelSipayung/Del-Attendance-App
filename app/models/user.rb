class User < OldDatabaseBase
  self.table_name = "sysx_user"
  def authenticate(password)
    BCrypt::Password.new(self.password_hash).is_password?(password)
  end
end
