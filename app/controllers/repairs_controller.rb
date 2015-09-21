class RepairsController < ApplicationController
	before_filter :login_required, :except => [:new, :create, :unlock_new, :unlock_new_form]
	skip_before_filter :delete_unlock_new_session_name, :only => [:new]

	def index
		redirect_to active_repairs_path
	end

	def active
		@repairs = Repair.all.where(:status => [0, 1]).search(params[:search], params[:option]).order("created_at ASC") # 0 is "active", 1 is "ready_for_pickup"
	end

	def inactive
		@repairs = Repair.all.where(status: 2).search(params[:search], params[:option]).order("created_at DESC") # 2 is "inactive"
	end

	def show
		@repair = Repair.find(params[:id])

		respond_to do |format|
			format.html
			format.pdf do
				pdf = RepairPdf.new(@repair)
				send_data pdf.render, filename: "repair-ID##{@repair.id}-#{@repair.customer_first_name}_#{@repair.customer_last_name}.pdf", type: 'application/pdf'
			end
		end
	end

	def new
		if session[:unlock_new_repair_employee_name]
			@repair = Repair.new
		else
			redirect_to unlock_new_repairs_path
		end
	end
	
	def unlock_new
		if request.get?
			# Just render view
		elsif request.post?
			employee_unlock_code = params[:employee_unlock_code]
			@user = User.find_by_website_code(employee_unlock_code)
			if @user
				session[:unlock_new_repair_employee_name] = @user.first_name + " " + @user.last_name
				puts session[:unlock_new_repair_employee_name]
				redirect_to new_repair_path
			else
				flash[:error] = "Incorrect Employee Unlock Code"
				render unlock_new_repairs_path
			end
		end
	end

	def create
		@repair = Repair.new(repair_params)
		if @repair.save
				flash[:success] = "Thank you for submitting your repair request."
				redirect_to root_url
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
										   :parts_fee, :state, :device_password_confirmation,
										   :sales_associate, :technician, :dropoff_signature_data,
										   :pickup_signature_data )
		end

		def login_required
			redirect_to login_path unless logged_in?
		end
end
