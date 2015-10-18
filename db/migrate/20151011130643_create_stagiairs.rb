class CreateStagiairs < ActiveRecord::Migration
  def up
  	create_table 'stagiairs' do |t|
      t.string 'surname'
      t.string 'name'
      t.text 'nova_id'
      t.text 'group'
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end

  def down
  	drop_table 'stagiairs'
  end
end
