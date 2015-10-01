class CompaniesController < ApplicationController
  def index
  	@companies =  Company.all
  end
  def show
    id = params[:id] # retrieve company ID from URI route
    @company = Company.find(id) # look up company by unique ID
    #debugger
    render(:partial => 'company', :object => @company) if request.xhr?
    # will render app/views/companies/show.<extension> by default
  end
	def new
		# default: render 'new'  template
	end
	def create
		@company = Company.new(params[:company])
		if @company.save
			flash[:notice]= "#{@company.name} aangemaakt."
			redirect_to companies_path
		else
			render 'new' # 'new'  template can access @company field values
		end
	end
	def edit
		@company = Company.find params[:id]
	end
	def update
		@company = Company.find params[:id]
		if @company.update_attributes(params[:company])
			flash[:notice] = "Bedrijfsinfo voor #{@company.name} gewijzigd."
			redirect_to companies_path
		else
			render 'edit' # 'edit' template can access @company field values
		end
	end
	def destroy
		@company =  Company.find(params[:id])
		@company.destroy
		flash[:notice] = "Bedrijf '#{@company.name}' verwijderd."
		redirect_to companies_path
	end
end


