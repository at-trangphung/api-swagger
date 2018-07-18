class Admin::TypesController < AdminController
  before_action :load_service

  def index
    @types = @service_type.load_list_type
  end

  def new
    @type = Type.new
  end

  def create
    @service_type.create
    redirect_to types_path
  end

  def edit
    @types = @service_type.load_list_type
    @type  = @service_type.find_type
  end

  def update
    @service_type.update
    redirect_to types_path
  end

  def destroy
    @service_type.destroy
    redirect_to types_path
  end

  private
  def load_service
    @service_type = TypeServices.new(params, flash)
  end
end
