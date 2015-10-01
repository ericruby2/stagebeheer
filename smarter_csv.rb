require 'smarter_csv'
  options = {}
    SmarterCSV.process('Bedrijven2.csv', options) do |chunk|
        chunk.each do |data_hash|
              Company.create!( data_hash )
    end
      end
