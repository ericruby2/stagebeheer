require 'csv'    

CSV.foreach('Stagiairs1.csv', :headers => true) do |row|
  puts row
  Stagiair.create!(Hash[row], :without_protection => true)
end
