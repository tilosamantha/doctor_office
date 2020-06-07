class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :destroy]

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
      redirect_to patient_appointment_path(@appointment), notice: "Appointment Created"
    else
      render :new
    end
  end

  def destroy
    @appointment.destroy
    redirect_to patient_appointment_path
  end

  private
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:month, :day)
    end
end