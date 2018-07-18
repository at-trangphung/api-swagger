class TypeServices
  attr_reader :params, :flash

  def initialize(params, flash)
    @params = params
    @flash  = flash
  end

  def create
    @type = Type.new type_params
    if @type.save
        flash[:success] = "add successfully"
    end
  end

  def update
    type = find_type
    if type.update(type_params)
      flash[:success] = "update successfully"
    end
  end

  def destroy
    type = find_type
    if type.destroy!
      flash[:success] = "deleted successfully"
    end
  end

  def find_type
    Type.find_by(id: params[:id])
  end

  def load_list_type
    Type.all.paginate(page: params[:page], per_page: 5)
  end

  def type_params
    params.require(:type).permit :name
  end
end  
