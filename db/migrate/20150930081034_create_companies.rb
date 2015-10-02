class CreateCompanies < ActiveRecord::Migration
  def up
    create_table 'companies' do |t|
      t.string 'name'
      t.string 'adress'
      t.string 'zip'
      t.string 'city'
      t.boolean 'applicatie'
      t.boolean 'beheer'
      t.boolean 'netwerk'
      t.boolean 'ecabo'
      t.string 'activity'
      t.string 'email'
      t.string 'comment'
      
      t.timestamps
    end
  end
  def down
  	drop_table 'companies' 
  end
end
