class ClientsController < ApplicationController

 load_and_authorize_resource

	before_filter :authenticate_user!
	def index
       @clients = current_user.role?("super_admin") ? Client.all : current_user.clients
	end

	def new
		@client = Client.new
		@bank_detail = @client.build_bank_detail
	end	

	def create
		@client = Client.new(client_params)
		@client.user_id = current_user.id
		if @client.save
			redirect_to clients_path, notice: "Client was successfully created"
		else 
			render "new"
		end	
	end	

	def show
		begin
		@client = current_user.role?("super_admin") ? Client.find(params[:id]) : current_user.client.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		redirect_to clients_path,notice: "Record Not Found"
	end
	end

	def edit
		begin
		@client = Client.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		redirect_to clients_path,notice: "Record Not Found"
	end
	@bank_detail = @client.bank_detail.nil? ? @client.build_bank_detail : @client.bank_detail
   end
		
	end

	def update
		@client = Client.find(params[:id])
		if @client.update_attributes(client_params)
			redirect_to client_path(@client.id),notice:"Successfully updated the client"
		else 
			render "edit"
		end
	end	
	def destroy
		@client = Client.find(params[:id])
		@client.destroy
		redirect_to clients_path,notice: "Successfully deleted the client"
	end

 private 

 def client_params
 	params[:client].permit(:name,:company,:website,:email,:mobile,bank_detail_attributes:[:acc_no,:bank_name,:tin_number])
 end


