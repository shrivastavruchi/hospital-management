class AppointmentsController < ApplicationController
	before_action :find_patient, :only=>[:new, :create,:edit,:update]
	before_action :find_appointment,	:only=>[:edit,:update,:destroy]

	def index
		authorize! :read, Appointment
		if current_user.has_role? (:doctor)
			@appointments = Appointment.where(:doctor_id=>current_user.id)
		else	
			@appointments = Appointment.all
		end
	end	

	def new
		authorize! :create, Appointment
		@appointment = Appointment.new
		@doctors  = User.with_role :doctor
	end	

	def create
		authorize! :create, Appointment
		@appoitnement = @patient.appointments.build(appointment_params)
		if @appoitnement.save
			redirect_to  appointments_path 
		else
			render :new
		end	
	end	
	def edit
		authorize! :edit, Appointment
	end
	
	def update
		authorize! :update, Appointment
		if @appointment.update(appointment_params)
			redirect_to appointments_path 
		else
			render :edit
		end	
	end	

	def destroy
		authorize! :delete, Appointment
		if @appointment.destroy
			redirect_to appointments_path ,notice: 'appointment was successfully destroyed.'
		end
	end	

	private

	def find_patient
		@patient = Patient.find(params[:patient_id])
	end	

	def find_appointment
		@appointment = Appointment.find_by_patient_id(params[:patient_id])
	end	

	def appointment_params
		params.require(:appointment).permit(:patient_id, :doctor_id, :consultation_type,:date,:appoint_time)
	end	

end
