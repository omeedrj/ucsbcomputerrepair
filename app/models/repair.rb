class Repair < ActiveRecord::Base

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	VALID_PHONE_NUMBER_REGEX = /\A[\d]{3}+\-[\d]{3}+\-[\d]{4}\z/

	validates :customer_first_name, presence: true, length: { maximum: 35 }
	validates :customer_last_name, 	presence: true, length: { maximum: 35 }
	validates :customer_id_number, length: { maximum: 20 }, numericality: true, allow_blank: true
	validates :customer_phone_number, presence: true
  validates :device_description, presence: true
	validates :customer_email, presence: true, length: { maximum: 255 }, 
						format: { with: VALID_EMAIL_REGEX }
  validates :customer_phone_number, presence: true, format: { with: VALID_PHONE_NUMBER_REGEX }, 
						allow_blank: true
	validates :device_problem_description, presence: true
  validates :terms_of_service_accepted, acceptance: true
  validates :services_fee, presence: true, :numericality => {:greater_than_or_equal_to => 0, :less_than => 1000000}
  validates :parts_fee, presence: true, :numericality => {:greater_than_or_equal_to => 0, :less_than => 1000000}

	enum status: [ :active, :ready_for_pickup, :inactive ]

end
