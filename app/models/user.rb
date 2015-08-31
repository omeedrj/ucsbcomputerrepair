class User < ActiveRecord::Base

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	before_save {self.email = email.downcase}

	validates :first_name, presence: true, length: { maximum: 35 }
	validates :last_name, presence: true, length: { maximum: 35 }
	validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}
	validates :username, presence: true, length: { maximum: 35 }, uniqueness: { case_sensitive: false}
	validates :website_code, presence: true, length: { maximum: 35 }, uniqueness: true, confirmation: true, on: :create
	validates :website_code, length: { maximum: 35 }, uniqueness: true, on: :update, allow_blank: true
	has_secure_password
    validates :password, presence: true, length: { minimum: 5 }, confirmation: true, on: :create
		validates :password, length: { minimum: 5 }, confirmation: true, on: :update, allow_blank: true

	enum role: [ :Admin, :Employee, :Top_Admin ]
end
