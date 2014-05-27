class CatsController < ApplicationController
	before_action :set_vino,  only: [:index, :new, :create]
       

  def new
  	 
     @cat = @vino.cat.build
          
  end

  def create
  	   	 
  	 @cat = @vino.cat.build(cat_params)
  	 if @cat.save
        	flash[:success] = 'Cata creada'
        	@u_catas = @vino.cat
        	calc_est_vino(@u_catas)
            redirect_to vinos_path 
        else
            render 'new'
        end
 
  end

  def index
  	  @cats = @vino.cat.paginate(page: params[:page], :per_page => 6,:order => 'total DESC')
  	  
  end

  def show
    @cat = @cat.vino
  end

  def destroy

  	@cat = Cat.find(params[:id]).destroy
  	@vino_id = @cat.vino_id
  	calc_est_vino_dest(@vino_id)
  	flash[:success] = 'Cata Borrada'
    redirect_to vino_cats_path(@vino_id)
  end

  def edit
    @cat = Cat.find(params[:id])
    @vin = Vino.find(:first, :conditions => { :id => @cat[:vino_id] })

  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      flash[:success] = "Cata actualizada"
      redirect_to vino_cats_path(@cat[:vino_id])
    else
      flash[:error] = "Cata no actualizada"
      render "edit"
    end
  end
  

  private

  # Use callbacks to share common setup or constraints between actions.
    def set_vino
      @vino = Vino.find_by_id(params[:vino_id])
    end


    def cat_params
      params.require(:cat).permit(:brillo, :amarillo, :rojo, :olfato, :retro_olfato, :peridental,
      	            :palatina, :lingual, :retrogusto, :complemento_blanco, :complemento_tinto,
      	            :total, :vino_id, :catador, :email, :comentario)
    end
    def vino_params
      params.require(:vino).permit(:vino, :zona, :tipo, :anno, :num_catas, :num_may,
                                   :cat_may, :cat_min, :cat_med)
    	
    end

    def calc_est_vino(u_catas)
      @num_catas = 0
      @cat_tot = 0
      @cat_may = 0
      @cat_min = 101
      @cat_med = 0
      u_catas.each do |cat|
        @num_catas = @num_catas + 1
        @cat_tot = @cat_tot + cat.total
        if cat.total > @cat_may
          @cat_may = cat.total
        end
        if cat.total < @cat_min 
          @cat_min = cat.total	
        end
      end
      @cat_med = @cat_tot / @num_catas
      Vino.find_by_id(params[:vino_id]) do |vino|
        vino.num_catas = @num_catas
        vino.cat_may = @cat_may
        vino.cat_min = @cat_min       
        vino.cat_med = @cat_med
        vino.save
      end	
    end

    def calc_est_vino_dest(vino_id)
      
#      @u_catas = Cat.find_all_by_vino_id(params[vino_id])	
      @u_catas = Cat.find(:all, :conditions => { :vino_id => vino_id }) 
      @num_catas = 0
      @cat_tot = 0
      @cat_may = 0
      @cat_min = 101
      @cat_med = 0
      @u_catas.each do |cat|
        @num_catas = @num_catas + 1
        @cat_tot = @cat_tot + cat.total
        if cat.total > @cat_may
          @cat_may = cat.total
        end
        if cat.total < @cat_min 
          @cat_min = cat.total	
        end
      end
      if @num_catas > 0
        @cat_med = @cat_tot / @num_catas
      else
        @cat_min = 0
      end
      @vino_find = Vino.find(:all, :conditions => { :id => vino_id })
      @vino_find.each do |vino|
      vino.num_catas = @num_catas
      vino.cat_may = @cat_may
      vino.cat_min = @cat_min       
      vino.cat_med = @cat_med
      vino.save
      end	
             
    end

    def det_tipo_vino?
	  !tinto.nil?
	end
end
