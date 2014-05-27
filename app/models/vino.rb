class Vino < ActiveRecord::Base

	has_many :cat
	
	validates :vino,  presence: true, uniqueness: { case_sensitive: false }
	validates :zona,  presence: true
	validates :tipo,  presence: true
	validates :anno,  presence: true
	
	before_save { self.vino = vino.upcase }
	before_save { self.zona = zona.upcase }
	before_save { self.tipo = tipo.upcase }

	TIPO_OPTIONS = {'Tinto' => "TINTO", 'Blanco' => "BLANCO", 'Rosado' => "ROSADO"}

	

end
