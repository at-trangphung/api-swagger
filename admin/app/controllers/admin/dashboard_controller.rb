class Admin::DashboardController < AdminController
  def index
    @products     = Product.all.size
    @orders       = Transaction.all.size
    @customers    = Customer.all.size
    @transactions = Transaction.where('created  BETWEEN ? AND ?', 
                                      Time.now-(30*3600*24), Time.now)
    @total        = 0
    @transactions.each do |order|
      if order.status == 'accept'
        @total += order.amount
      end
    end  
    @new_transactions = Transaction.where('created  BETWEEN ? AND ?', 
                                      Time.now-(3600*24), Time.now)
  end

  
end
