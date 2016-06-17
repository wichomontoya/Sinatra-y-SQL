require "./tecnica.rb"
class Heroe
	#Caracteristicas
	attr_reader :tecnicas
	attr_accessor :nivelDePoder,:nombre,:id

	FASEUNO=1
	FASEDOS=2
	FASETRES=3
	#Constructor
	def initialize nombre,nivelDePoder,id
		@id=id
		@nombre=nombre
		@nivelDePoder=nivelDePoder
		@tecnicas=[]
	end

	def aprenderTecnica(tecnica)
		@tecnicas.push(tecnica)
	end
    #Comportamiento (Métodos)
    def obtenerExperiencia(poder)
    	@nivelDePoder+=poder
    end


end

#var Heroe=function(nombre, nivelDePoder){
#	this.nombre=nombre
#	this.nivelDePoder=nivelDePoder
#}










