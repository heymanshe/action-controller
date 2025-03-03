class ClientsController < ApplicationController
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to new_client_path, notice: "Client created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :email)
  end
end
