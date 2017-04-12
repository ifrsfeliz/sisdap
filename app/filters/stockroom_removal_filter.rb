class StockroomRemovalFilter < BaseFilter
  attr_accessor :start_date, :end_date, :user

  def initialize(options = {})
    @start_date = Date.strptime(options[:start_date], '%d/%m/%Y') if options[:start_date].present?
    @end_date   = Date.strptime(options[:end_date], '%d/%m/%Y')   if options[:end_date].present?
    @user       = User.find(options[:user]) if options[:user].present?
  end

  def search
    @stockroom_removals = StockroomMovimentation.removal

    if @start_date && @end_date
      @stockroom_removals = @stockroom_removals.created_between(start_date, end_date).order(created_at: :desc)
    end

    @stockroom_removals = @stockroom_removals.where(user: @user) if ! @user.nil?

    @stockroom_removals = @stockroom_removals.order(created_at: :desc)
  end

end

