class FileParser
  attr_reader :not_imported, :amount, :sales

  def initialize(content)
    @file_content = content
    @not_imported = []
    @amount = 0
    @sales = Array.new
  end

  def parse_file
    i = 0

    @file_content.each_line do |line|
      row = line.split("\t")
      if i > 0
        sale = Sale.create(buyer: row[0].to_s,
                           description: row[1].to_s,
                           price: row[2].to_f,
                           quantity: row[3].to_i,
                           address: row[4].to_s,
                           supplier: row[5].to_s)

        if sale.errors.any?
          not_imported << {row: i, errors: sale.errors}
        else
          @amount += sale.price * sale.quantity
          @sales.push(sale)
        end
      end

      i += 1
    end

    return @sales
  end
end
