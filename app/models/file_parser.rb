require 'csv'

class FileParser
  attr_reader :not_imported, :amount, :sales

  def initialize(content)
    @csv_text = content
    @not_imported = []
    @amount = 0
    @sales = Array.new
  end

  def parse_file
    i = 1

    csv = CSV.parse(@csv_text, headers: true, col_sep: "\t")

    csv.each do |row|
      sale = Sale.create(buyer: row[0].to_s,
                         description: row[1].to_s,
                         price: row[2].to_f,
                         quantity: row[3].to_i,
                         address: row[4].to_s,
                         supplier: row[5].to_s)
      p sale
      if sale.errors.any?
        not_imported << { row: i, errors: sale.errors }
      else
        @amount += sale.price * sale.quantity
        @sales.push(sale)
      end

      i += 1
    end

    @sales
  end
end
