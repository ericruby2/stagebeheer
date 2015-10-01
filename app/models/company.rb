class Company < ActiveRecord::Base
	attr_accessible :name,:adress, :zip, :city, :abn, :ecabo, :activity, :email, :comment
	
	
end
