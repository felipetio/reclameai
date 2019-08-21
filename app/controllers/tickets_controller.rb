class TicketsController < ApplicationController
  def index
    @tickets= Ticket.all
  end

  def new 
    @ticket = Ticket.new()
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.ip_address= request.remote_ip

    if @ticket.save
        redirect_to @ticket, alert: "Ticket created successfully."
    else
        redirect_to new_tickets_path, alert: "Error creating ticket."
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  private

  def ticket_params
    params.require(:ticket).permit(:order_id, :description, :ip_address)
  end
end
