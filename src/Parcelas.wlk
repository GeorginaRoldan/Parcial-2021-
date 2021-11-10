import Plantas.*

class Parcela {
	var property ancho 
	var property largo 
	var property solQueRecibe
	var property plantasQueTiene = []
	
	method superficie() = ancho*largo
	
	method cantidadMaximaDePlantas(){
		return if (ancho > largo) {self.superficie() / 5} else {self.superficie() / 3 + largo}
	}
	
	method tieneComplicaciones(){
		return plantasQueTiene.any({plant => plant.solQueTolera() > solQueRecibe})
	}
	
	method plantar(planta){
		if(plantasQueTiene.size() >= self.cantidadMaximaDePlantas() or planta.solQueTolera() < solQueRecibe){
			self.error("No se puede plantar" )
		} else {
			plantasQueTiene.add(planta)
		}
	}
	
	method plantaQueSeAsociaBien(planta)
	
}

class ParcelaEcologica inherits Parcela{
	override method plantaQueSeAsociaBien(planta){
		return not self.tieneComplicaciones() and planta.esUnaParcelaIdeal(self) 
	}
}

class ParcelaIndustrial inherits Parcela{
	override method plantaQueSeAsociaBien(planta){
		return self.plantasQueTiene().size() <= 2 and planta.esFuerte() 
	}
}

object inta{
	const  parcelas = []
	
	method promedioDePlantasPorParcelas(){
		return parcelas.sum({parcela => parcela.map({parc => parc.plantasQueTiene().size()})}) / parcelas.size()
	}
	
	method parcelaMasAutosustentable(){
		return parcelas.map({parc => parc.map({p => p.plantasQueTiene().size() > 4})}) 
	}
}













