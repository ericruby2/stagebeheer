require 'csv'    

CSV.foreach('Bedrijven4.csv', :headers => true) do |row|
  puts row
  Company.create!(Hash[row], :without_protection => true)
end
