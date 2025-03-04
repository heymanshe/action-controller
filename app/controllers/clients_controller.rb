require "prawn"

class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "client", template: "clients/show"
      end
    end
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to @client, notice: "Client was successfully created."
    else
      render :new
    end
  end


  def download_pdf
    # client = Client.find(params[:id])
    # file_path = Rails.root.join("files", "clients", "#{client.name}.pdf")
    # send_data generate_pdf(client),
    #           filename: "#{client.name}.pdf",
    #           type: "application/pdf",
    #           disposition: "attachment"

    # send_file("#{Rails.root}/files/clients/#{client.name}.pdf",
    #       filename: "#{client.name}.pdf",
    #       type: "application/pdf")
  end

  private

  def generate_pdf(client)
    #   Prawn::Document.new do
    #     text client.name, align: :center, size: 20, style: :bold
    #     move_down 20
    #     text "Address: #{client.address}", size: 14
    #     text "Email: #{client.email}", size: 14
    #   end.render
    # end
    "PDF Content for #{client.name}"
  end
end
