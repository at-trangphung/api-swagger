module Api::V1
  
  class CheckoutsController < ApiController
    def show
      @transaction = Transaction.find_by( id: params[:id])
      if @transaction.present?
        render json: @transaction
      else
        render json: {message: 'Not found' }
      end
    end

    def create
      @new_transaction = checkout
      if @new_transaction.present?
        render json: @new_transaction
      else
        render json: {message: 'failed!'}
      end
    end

    private
    def checkout
      @customer = Customer.new(customer_params)
      @customer_member = Customer.find_by(user_id: @customer.user_id)

      if @customer_member
        @transaction = create_transaction
        @transaction.customer_id = @customer_member.id
        @transaction.amount = params[:amount]
      else
        @check_user =  User.find_by(email: @customer.email)

        if @check_user
          @user_customer = Customer.find_by(email: @check_user.email)
          if @user_customer
            @transaction = create_transaction
            @transaction.customer_id = @user_customer.id
            @transaction.amount =  params[:amount]
          else
            @customer.user_id = @check_user.id
            @customer.save! 
            @transaction = create_transaction
            @transaction.customer_id = @customer.id
            @transaction.amount =  params[:amount]
          end
        else
          @new_user = create_new_user
          @customer.user_id = @new_user.id
          @customer.save! 
          @transaction = create_transaction
          @transaction.customer_id = @customer.id
          @transaction.amount =  params[:amount]
        end
      end
      if @transaction.save!
        order_detail = Order.new(order_params)
        order_detail.transaction_id = @transaction.id
        order_detail.save
        if @new_user
          UserMailer.new_user_checkout(@new_user).deliver_now
        end
        # @transaction.send_check_order_email
        session[:transaction_id] = @transaction.id
        session[:shopping_cart] = []
      end
      @transaction
    end
    
    def create_transaction
      @transaction = Transaction.new
      @transaction.created = Time.now
      @transaction.receiver = receiver_params["last_name"]
      @transaction.phone_rec = receiver_params["phone"]
      @transaction.address_deliver_rec = receiver_params["address_deliver"]
      hours_delivery = params[:hours]
      minutes_delivery = params[:minutes]
      @transaction.comment = params[:comment]
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

    def customer_params
      params.require(:customer).permit(
              :first_name, :last_name, :email, :company, :address, :address_deliver, :phone
            )
    end

    def receiver_params
      params.require(:customer).permit(
              :first_name, :last_name, :email, :company, :address, :address_deliver, :phone
            )
    end

    def order_params
      params.require(:order).permit(
                :product_id, :quantity, :total_payment, :price, :size, :type
              )
      end
    
  end

end
