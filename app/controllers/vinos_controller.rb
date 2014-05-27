class VinosController < ApplicationController
  before_action :set_vino, only: [:show, :edit, :update, :destroy] #[:index, :new, :create]
  
  def index
     @vinos = Vino.paginate(page: params[:page],:per_page => 7,:order => 'vino ASC')
     
  end

  def show
     @vino = Vino.find(params[:id])
  end

    
  def new
    @vino = Vino.new

  end

  def create
  	@vino = Vino.new(vino_params)
  	
        if @vino.save
        	flash[:success] = "Vino creado"
            redirect_to vinos_path 
        else
            redirect_to root_path 
        end
  end

  def edit
    @vino = Vino.find(params[:id])
  end

  def update
    @vino = Vino.find(params[:id])
    if @vino.update_attributes(vino_params)
      flash[:success] = "Vino actualizado"
      redirect_to vinos_path 
    else
      render "edit"
    end
  end

  def destroy
    
    @cat = Cat.find(:first, :conditions => { :vino_id => @vino[:id] })
    if @cat
      flash[:error] = "No puedes borrar el vino porque tiene catas"
      redirect_to vinos_url
    else
      Vino.find(params[:id]).destroy
      flash[:success] = "Vino borrado."
      redirect_to vinos_url
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
    def set_vino
      @vino = Vino.find(params[:id])
    end

  def vino_params
    params.require(:vino).permit(:vino,:zona, :tipo, :anno, :grados, :precio)
                                   
  end
  
end
