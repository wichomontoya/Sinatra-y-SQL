class Tecnica

	attr_accessor :nombre,:tipoDanio,:danio
	CONTUNDENTE=1
	CORTOPUNZANTE=2
	ENERGIA=3
	def initialize nombre,tipoDanio,danio
		@nombre=nombre
		@tipoDanio=tipoDanio
		@danio=danio
	end
end