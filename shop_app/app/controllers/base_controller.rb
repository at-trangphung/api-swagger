class BaseController < ApplicationController
  protect_from_forgery with: :exception
  attr_reader :service_user

  attr_accessor :total
  # include Services
  include ViewHelper

  before_action :get_service
  helper_method :current_order
  before_action :load_cart
  
  def get_service
    @service_user = UserServices.new(session, cookies, params)
  end

  def logged_in?
    @service_user.current_user.present?
  end

  def current_order
    session[:shopping_cart] ||= session[:shopping_cart]
  end

  def load_cart
    @count_products = 0     
    @order_items = []
    return if current_order.nil?
    @total = 0
    current_order.each do |item|
      @count_products += item["quantity"]
      @total += (item["quantity"].to_f * item["price"].to_f)
      item["total_payment"] = (item["quantity"].to_f * item["price"].to_f)
      @order_items << Order.new(item)
    end
    @order_items
  end
end
