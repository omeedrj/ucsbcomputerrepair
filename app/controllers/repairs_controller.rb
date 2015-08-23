class RepairsController < ApplicationController
	def index
		@repairs = Repair.all.order(created_at: :asc)
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

	end

	private
		def repair_params
			params.require(:repair).permit(:customer_first_name, :customer_last_name,
										   :customer_id_number, :customer_email, :customer_phone_number,
										   :device_description, :device_password, :device_serial_number,
										   :accessories_description, :device_problem_description,
										   :repair_description, :services_fee,
										   :parts_fee )
		end
end
