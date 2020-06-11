class AppointmentsController < ApplicationController
  before_action :set_patient
  before_action :set_appointment, only: [:show, :edit, :destroy]

  def index
    @appointments = Appointment.all
  end

  def show
  end

  def new 
    @appointment = @patient.appointments.new
  end

  def create
    @appointment = @patient.appointments.new(appointment_params)
    if @appointment.save
      redirect_to patient_path(@patient)
    else
      render :new
    end
  end

  def destroy
    @patient.appointments.find(paramans[:id]).destroy
    redirect_to patient_appointments_path(@patient)
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end
  
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:month, :day, :doctor_id)
  end
end