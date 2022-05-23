require 'csv'
require_relative 'isbn_generator'
file = "file.csv"
cant_x = ARGV[0].to_i
cant = 1_000_000 * cant_x
CSV.open(file, "wb") do |csv|
  csv << ["Date","ISBN","Amount"]
  cant.times do
    csv << ["#{Time.new.strftime("%y-%m-%d")}","#{IsbnGenerator.new}","#{rand(100.0...5000.9).ceil(2)}"]
  end
end
