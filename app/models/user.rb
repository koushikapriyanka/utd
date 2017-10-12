class User < ApplicationRecord
	has_many :projects

	before_save :generate_salt
	before_save :encrypt_password
	
	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
	validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true

	def verify_password(pwd)
  	(self.encrypted_password == Digest::MD5.hexdigest(Digest::MD5.hexdigest(pwd)+ salt))
	end

	def self.auth(user_credential, password)
    user = User.find_by_email(user_credential) if EMAIL_REGEX.match(user_credential)
	  user ||= User.find_by_username(user_credential)
	  return false unless user
	  return user if user.verify_password(password)
		false
	end

	def encrypt_password
		return nil if self.encrypted_password.blank?
		self.salt = generate_salt
		self.encrypted_password = Digest::MD5.hexdigest(Digest::MD5.hexdigest(encrypted_password)+ self.salt)
	end

	def generate_salt
    subsets = [("a".."z"), ("A".."Z"), (0..9), ("!".."?"), ("µ".."ö")]
    chars = subsets[0..9].map { |subset| subset.to_a }.flatten 
    self.salt = chars.sample(9).join
  end
end
