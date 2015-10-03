class Company < ActiveRecord::Base
	attr_accessible :name,:adress, :zip, :city, :applicatie, :beheer, :netwerk, :ecabo, :activity, :email, :comment
	def self.all_selections ; [:applicatie, :beheer, :netwerk] ; end #  shortcut: array of strings
	
end
