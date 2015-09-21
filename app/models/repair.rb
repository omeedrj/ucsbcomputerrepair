class Repair < ActiveRecord::Base

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	VALID_PHONE_NUMBER_REGEX = /\A[\d]{3}+\-[\d]{3}+\-[\d]{4}\z/

	validates :customer_first_name, presence: true, length: { maximum: 35 }
	validates :customer_last_name, 	presence: true, length: { maximum: 35 }
	validates :customer_id_number, length: { maximum: 20 }, numericality: true, allow_blank: true
  validates :device_description, presence: true
	validates :customer_email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, presence: true, :unless => :customer_phone_number? 
  validates :customer_phone_number, format: { with: VALID_PHONE_NUMBER_REGEX }, presence: true, :unless => :customer_email?
	validates :device_password, confirmation: true
	validates :device_problem_description, presence: true
  validates :services_fee, presence: true, :numericality => {:greater_than_or_equal_to => 0, :less_than => 1000000}
  validates :parts_fee, presence: true, :numericality => {:greater_than_or_equal_to => 0, :less_than => 1000000}

	enum status: [ :active, :ready_for_pickup, :inactive ]

	def self.search(search, option)
	  query = "%#{search}%"
	  choice = "%#{option}"
	  case option
	  when "First Name"
	  	self.where("customer_first_name ILIKE ?", query)
	  when "Last Name"
	  	self.where("customer_last_name ILIKE ?", query)
	  when "ID Number"
	  	self.where("customer_id_number ILIKE ?", query)
	  when "Email"
	  	self.where("customer_email ILIKE ?", query)
	  when "Phone Number"
	  	self.where("customer_phone_number ILIKE ?", query)
	  when "Device Description"
	  	self.where("device_description ILIKE ?", query)
	  when "Problem Description"
	  	self.where("device_problem_description ILIKE ?", query)
	  when "Serial Number"
	  	self.where("device_serial_number ILIKE ?", query)
	  when "Accessories"
	  	self.where("accessories_description ILIKE ?", query)
	  when "Repair Description"
	  	self.where("repair_description ILIKE ?", query)
	  when "Technician"
	  	self.where("technician ILIKE ?", query)
	  when "Sales Associate"
	  	self.where("sales_associate ILIKE ?", query)
	  else 
		  if search
		    self.where("customer_first_name ILIKE ? or customer_last_name ILIKE ? or customer_id_number ILIKE ?  or customer_email ILIKE ? or customer_phone_number ILIKE ? or device_description ILIKE ? or device_problem_description ILIKE ? or device_serial_number ILIKE ? or accessories_description ILIKE ? or repair_description ILIKE ? or technician ILIKE ? or sales_associate ILIKE ?", query, query, query, query, query, query, query, query, query, query, query, query)
		  else
		    self.all
		  end
		end
	end

end
