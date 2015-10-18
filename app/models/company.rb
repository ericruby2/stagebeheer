class Company < ActiveRecord::Base
	attr_accessible :name,:adress, :zip, :city, :applicatie, :beheer, :netwerk, :ecabo, :activity, :email, :comment
	def self.all_selections ; [:applicatie, :beheer, :netwerk, :blanco] ; end #  shortcut: array of strings
	def self.no_type
		find(:all, 	
    		:conditions => ['applicatie is ? AND beheer is ? AND netwerk is  ?' , nil, nil, nil])
	end
end
