class StockroomRemovalFilter < BaseFilter
  attr_accessor :start_date, :end_date

  def initialize(options = {})
    @start_date = Date.strptime(options[:start_date], '%d/%m/%Y') if options[:start_date].present?
    @end_date   = Date.strptime(options[:end_date], '%d/%m/%Y')   if options[:end_date].present?
  end

  def search
    if @start_date && @end_date
      StockroomMovimentation.removal.created_between(start_date, end_date)
    else
      StockroomMovimentation.removal
    end
  end

end

