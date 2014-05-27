module VinosHelper
	def have_cat?
	  @cat = Cat.find(:first, :conditions => { :vino_id => @vino[:id] })
      
    end
end
