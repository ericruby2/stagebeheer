class CreateCompanies < ActiveRecord::Migration
  def up
    create_table 'companies' do |t|
      t.string 'name'
      t.string 'adress'
      t.string 'zip'
      t.string 'city'
      t.string 'abn'
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
