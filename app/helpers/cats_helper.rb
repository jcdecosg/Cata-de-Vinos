module CatsHelper
	def det_tipo_vino?
	 @vin = Vino.find_by_id(params[:vino_id])
     if @vin[:tipo] == "TINTO"
  	 	tinto = @vin[:tipo]
  	 else
  	    tinto = nil	
  	 end
	  !tinto.nil?
	end

	def det_tipo_vino_e?
	 @cat = Cat.find(params[:id])
	 @vin = Vino.find(:first, :conditions => { :id => @cat[:vino_id] })
     if @vin[:tipo] == "TINTO"
  	 	tinto = @vin[:tipo]
  	 else
  	    tinto = nil	
  	 end
	  !tinto.nil?
	 	 
	 end
end
