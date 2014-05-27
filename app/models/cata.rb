class Cata < ActiveRecord::Base
	belongs_to :vino
	default_scope -> { order('catador ASC') }
	validates :vino_id,  presence: true
end
