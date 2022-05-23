require 'csv'
require_relative 'book_in_stock'
class CsvReader

  def read_in_csv_data(csv_file_name)
    @books = Enumerator.new do |yielder|
      CSV.foreach("file.csv", headers: true) do |row|
        yielder << BookInStock.new(row["ISBN"], row["Amount"])
      end
    end

  end

  def total_value_in_stock
    sum = 0.0
    loop do
      sum += @books.next.price
    end
    return sum.ceil(2)
  end
end
