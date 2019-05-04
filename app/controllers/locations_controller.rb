class LocationsController < ApplicationController
	def index
	   @locations = Location.all 
	   @locations = @locations.paginate(:page => 1, :per_page => 15)

	end
	def new
		@location = Location.new
	end
	def create
		@location = Location.new(location_params)
		if @location.save
			flash[:notice] = t('location.created_successfully')
			redirect_to locations_path
		else
			render :new
		end
	end
	def edit
		@location = Location.find_by(id: params[:id])
	end

	def update		
		@location = Location.find_by(id: params[:id])
		if @location.update_attributes(location_params)
			flash[:notice] = t('location.updated_successfully')
			redirect_to locations_path
		else
			render :edit
		end
	end

	def destroy
		@location = Location.find_by(id: params[:id])
		if @location.delete
			flash[:notice] = t('location.deleted_successfully')
			redirect_to locations_path
		end
	end

	def show
		@location = Location.find_by(id: params[:hash_id])
		respond_to do |format|
			format.html {}
			format.json{ @location}
		end
	end

	def export
		@locations =Location.all
		respond_to do |format|
		format.html
		format.csv { send_data @locations.to_csv, filename: "locations-#{Date.today}.csv" }
		end
	end

	########## it is strong the fileo mysql server################## t 

	def export_csv
		file_name = "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/locations_#{Time.now.strftime('%Y-%m-%d_%H-%M-%S')}.csv"

		data = ActiveRecord::Base.connection.exec_query(" SELECT city,address FROM locations 
		INTO OUTFILE '#{file_name}' FIELDS TERMINATED BY ','
		ENCLOSED BY '\"'
		LINES TERMINATED BY '\n'")
		send_file("#{file_name}" ,
		:type => 'application/pdf/docx/html/htm/doc',
		:disposition => 'attachment') 
	end

	private

	def location_params
		params.require(:location).permit(:city,:address,:hash_id)
	end
end
