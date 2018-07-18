# module Services
  class CheckoutServices
    attr_reader :params, :current_user, :order_items, :total, :session

    def initialize(params, current_user, order_items, total, session)
      @params       = params
      @current_user = current_user
      @order_items  = order_items
      @total        = total
      @session      = session
    end

    def checkout
      @customer = Customer.new(customer_params)
      
      if current_user.present?
        @customer.user_id = @current_user.id if @customer.user_id.nil?
        @customer_member = Customer.find_by(user_id: @customer.user_id)
      end

      if @customer_member
        @transaction = create_transaction
        @transaction.customer_id = @customer_member.id
        @transaction.amount = @total
      else
        @check_user =  User.find_by(email: @customer.email)

        if @check_user
          @user_customer = Customer.find_by(email: @check_user.email)
          if @user_customer
            @transaction = create_transaction
            @transaction.customer_id = @user_customer.id
            @transaction.amount = @total
          else
            @customer.user_id = @check_user.id
            @customer.save! 
            @transaction = create_transaction
            @transaction.customer_id = @customer.id
            @transaction.amount = @total
          end
        else
          @new_user = create_new_user
          @customer.user_id = @new_user.id
          @customer.save! 
          @transaction = create_transaction
          @transaction.customer_id = @customer.id
          @transaction.amount = @total
        end
      end
      if @transaction.save!
        @order_items.each do |order_detail|
          order_detail.transaction_id = @transaction.id
          order_detail.save
        end
        if @new_user
          UserMailer.new_user_checkout(@new_user).deliver_now
        end
        # @transaction.send_check_order_email
        session[:transaction_id] = @transaction.id
        session[:shopping_cart] = []
      end
    end
    
    def create_transaction
      @transaction = Transaction.new
      @transaction.created = Time.now
      @transaction.receiver = receiver_params["last_name"]
      @transaction.phone_rec = receiver_params["phone"]
      @transaction.address_deliver_rec = receiver_params["address_deliver"]
      hours_delivery = params[:transaction][:transaction][:hours]
      minutes_delivery = params[:transaction][:transaction][:minutes]
      @transaction.comment = params[:transaction][:transaction][:comment]
      if ( hours_delivery.blank? && minutes_delivery.blank? )
        @transaction.delivery_time = Time.zone.now
      else
        @transaction.delivery_time = Time.zone.now + hours_delivery.to_i.hours 
                                                   + minutes_delivery.to_i.minutes
      end
      @transaction
    end

    def create_new_user
      @new_user = User.new
      @new_user.password = "Thuanhieu123"
      @new_user.first_name = customer_params[:first_name]
      @new_user.last_name = customer_params[:last_name]
      @new_user.email = customer_params[:email]
      @new_user.address = customer_params[:address]
      @new_user.address_deliver = customer_params[:address_deliver]
      @new_user.company = customer_params[:company]
      @new_user.phone = customer_params[:phone]
      @new_user.save!
      @new_user
    end

    def load_order
      Order.where(transaction_id: params[:id])
    end

    def load_transaction
      Transaction.find_by(id: params[:id])
    end

    def load_customer
      @transaction = Transaction.find_by(id: session[:transaction_id])
      Customer.find_by(id: @transaction.customer_id)
    end

    def customer_params
      params.require(:transaction)[:customer]
            .permit(
              :first_name, :last_name, :email, :company, :address, :address_deliver, :phone
            )
    end

    def receiver_params
      params.require(:transaction)[:receiver]
            .permit(
              :first_name, :last_name, :email, :company, :address, :address_deliver, :phone
            )
    end
  end
# end
