class RepairsController < ApplicationController
	before_filter :login_required, :except => [:new, :create]

	def index
		redirect_to active_repairs_path
	end

	def active
		@repairs = Repair.all.where(:status => [0, 1]).order("created_at ASC") # 0 is "active", 1 is "ready_for_pickup"
	end

	def inactive
		@repairs = Repair.all.where(status: 2).order("created_at DESC") # 2 is "inactive"
	end

	def show
		@repair = Repair.find(params[:id])
	end

	def new
		@repair = Repair.new
	end
	
	def create
		@repair = Repair.new(repair_params)
		if @repair.save
				redirect_to @repair
			else 
				render 'new'
		end
	end

	def edit
		@repair = Repair.find(params[:id])
	end

	def update
		@repair = Repair.find(params[:id])
		if @repair.update(repair_params)
			redirect_to @repair
		else
			render 'edit'
		end
	end

	def destroy
		@repair = Repair.find(params[:id])
		@repair.destroy
		redirect_to repairs_path
	end

	def change_status
		@repair = Repair.find(params[:id])
		@repair.update_attribute(:status, params[:state])
		redirect_to repairs_path
	end



	private
		def repair_params
			params.require(:repair).permit(:customer_first_name, :customer_last_name,
										   :customer_id_number, :customer_email, :customer_phone_number,
										   :device_description, :device_password, :device_serial_number,
										   :accessories_description, :device_problem_description,
										   :repair_description, :services_fee,
										   :parts_fee, :state, :device_password_confirmation )
		end

		def login_required
			redirect_to login_path unless logged_in?
		end
end
