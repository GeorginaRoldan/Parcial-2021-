import Parcelas.*

class Planta{
	var property anioDeObtencionDeSemilla = 0 
	var property altura = 0 
	method solQueTolera()
	method esFuerte() = self.solQueTolera() > 10
	method daSemillasNuevas(){ return self.esFuerte()}
	method espacioQueOcupa()
	method esUnaParcelaIdeal(parcela)
	method parcelaDondeAsociarse(parcela){ parcela.plantaQueSeAsociaBien(self)}
}

class Menta inherits Planta{
	override method solQueTolera() = 6
	override method daSemillasNuevas() = super() or self.altura() > 0.4
	override method espacioQueOcupa() = altura*3
	override method esUnaParcelaIdeal(parcela) = parcela.superficie() > 6 
}

class Soja inherits Planta{
	override method solQueTolera(){
		return if(self.altura() < 0.5) {6} else if (self.altura().between(0.5,1)) {7} else {9}
	}	
	override method daSemillasNuevas() = super() or (self.anioDeObtencionDeSemilla() > 2007 and self.altura() > 1)
	override method espacioQueOcupa() = altura/2
	override method esUnaParcelaIdeal(parcela) = self.solQueTolera() == parcela.solQueRecibe()
}

class Quinoa inherits Planta{ 
	var property solQueTolera 
	override method espacioQueOcupa() = 0.5
	override method daSemillasNuevas() = super() or self.anioDeObtencionDeSemilla() < 2005
	override method esUnaParcelaIdeal(parcela) = parcela.plantasQueTiene().all({plant => plant.altura() < 1.5})
}

class SojaTransgenica inherits Soja{
	override method daSemillasNuevas() = false 
	override method esUnaParcelaIdeal(parcela) = parcela.cantidadMaximaDePlantas() == 1 
}

class HierbaBuena inherits Menta{
	override method espacioQueOcupa() = super()*2
}



