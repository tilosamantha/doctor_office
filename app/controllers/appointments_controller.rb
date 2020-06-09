class AppointmentsController < ApplicationController
  before_action :set_patient, only: [:show, :destroy]

  def index
    @appointments = @patient.appointments
  end

  def show
  end

  def new
    # @doctors = Doctor.all - @patient.doctors
    @appointment = Appointment.new
  end

  def create
    @appointment = @patient.appointments.new(appointment_params)
    if @appointment.save
      redirect_to patient_appointments_path(@patient), notice: "Appointment Created"
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
      params.require(:appointment).permit(:month, :day)
    end
    
    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

end