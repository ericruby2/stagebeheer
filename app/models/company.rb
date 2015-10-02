class Company < ActiveRecord::Base
	attr_accessible :name,:adress, :zip, :city, :applicatie, :beheer, :netwerk, :ecabo, :activity, :email, :comment
	
	
end
