class AppointmentsController < ApplicationController
  before_action :set_patient, only: [:show, :destroy]

  def index
    @appointments = Appointment.all
  end

  def show
  end

  def new 
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
 
    if @appointment.save
      redirect_to @appointment
    else
      render :new
    end
  end

  def destroy
    @patient.appointments.find(paramans[:id]).destroy
    redirect_to patient_appointments_path(@patient)
  end

  private
    def appointment_params
      params.require(:appointment).permit(:month, :day, :patient_id)
    end
    
    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

end