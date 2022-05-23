require 'csv'
require_relative 'isbn_generator'
file = "file.csv"
cant_x = ARGV[0].to_i
cant = 1_000_000 * cant_x
CSV.open(file, "wb") do |csv|
  csv << ["Date","ISBN","Amount"]
  cant.times do
    csv << ['"2008-04-12","978-1-9343561-0-4",22.11']
  end
end
