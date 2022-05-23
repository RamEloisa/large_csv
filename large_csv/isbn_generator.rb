class IsbnGenerator
  attr_reader :isbn
  def initialize
    pref = ["978", "979"]
    isbn_prefix = pref[rand(2)].to_s
    isbn_group = rand(100000).to_s
    isbn_regis = rand(10000000).to_s
    isbn_publi = rand(1000000).to_s
    string_n = (isbn_prefix + isbn_group + isbn_regis + isbn_publi).chars
    arr_n = Array.new
    key = 1
    string_n.each do |valor|
      if key == 1
        arr_n << valor
        key = 2
      else
        arr_n << valor.to_i*2
        key = 1
      end
    end
    modu_10 = arr_n.reduce { |str, n| str.to_s + n.to_s }.chars.reduce { |sum, n| sum.to_i + n.to_i }%10
    if modu_10 == 0
      isbn_check = 0
    else
      isbn_check = 10 - modu_10
    end
    @isbn = "#{isbn_prefix}-#{isbn_group}-#{isbn_regis}-#{isbn_publi}-#{isbn_check}"
  end
  def to_s
    @isbn
  end
end
