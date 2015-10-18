class CompaniesController < ApplicationController
  def index
  	@all_selections=Company.all_selections
  	if !params[:sortarg].nil?
			@sortarg = params[:sortarg]
			session[:sortarg] = @sortarg
#		@fromsess = false
		else
			@sortarg = session[:sortarg]
#		@fromsess= true
		end
  	@companies =  Company.order(@sortarg)
  	@name_class = (@sortarg == "name" ? "hilite" : nil)
		@city_class = (@sortarg == "city" ? "hilite" : nil)
		@appCheck = true
		@selected = Hash.new
	if !params["selections"].nil? 
		@selected = params["selections"]
		session[:selections]= params["selections"]
		@fromsess ||= false
	else 
		@selected = session[:selections]
		@fromsess ||= true
	end
	if @selected == nil

		@full_selected = @all_selections.collect { |v| [v,1]} 
		@selected =Hash[@full_selected]
	end
	
	if  params[:id] == nil
				@companies = []
				@selected.each do |s|
#					debugger
					if s[0] == "blanco"
						Company.no_type.each do |c|
							@companies << c
						end	
					else

						Company.where(s[0] => :true).each do |record|
							@companies << record
						end
					end
	end
				
#debugger
	    	@companies = @companies.uniq.sort_by { |hsh| hsh[@sortarg] }
	  
		@full_selected = @all_selections.collect { |v| [v,1] }
		#@selected = Hash[@full_selected]

	end	
	#debugger
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


