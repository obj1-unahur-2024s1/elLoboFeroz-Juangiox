/** First Wollok example */
object loboFeroz {
	var peso = 10
	var tieneRopaDeAbuelita = false
	var estaEnojado = false
	method peso(){
		return peso
	}
	method estaSaludable() {
		return peso.between(20, 150)
	}
	method agregarPeso(pesoADar){
		peso += pesoADar
	}
	method morir(){
		peso = 0
	}
	method sufrirUnaCrisis(){
		peso = 10
	}
	method comer(algo){
		peso += algo.peso()/10
	}
	method correr(){
		peso -= 1
	}
	method hablarConCaperucitaEnBosque(){
		caperucita.podraResponder()
		return "Hola Caperucita"
	}
	method disfrazarse(){
		abuelita.perderRopa()
		tieneRopaDeAbuelita = true
	}
	method estaraEnojado(){
		estaEnojado = true
	}
	method responderACaperucitaEnCasa(){
		if(estaEnojado){
			return "AH MALEDUCADA TE VOY A COMEEEEEERRRRRR"
		}
		else return "no hay nadie insultandome aqui"
	}
	method soplarCasa(casa){
		if(peso<=casa.resistencia()+casa.pesoChanchos()){
			self.morir()
			return "Soplaré, soplaré y... me quedo sin aire...ahg (el Lobo está muerto, vencieron los chanchitos. Fin.)"
		}else{
			peso -= casa.resistencia()
			casa.destruir()
			return "Soplaré, soplaré y SOPLARÉ, a los chanchitos ALMORZARÉ"
		}
		
	}
	method comerChanchitos(){
		if(casaDeLadrillos.estaDestrozada()){
			return "¿Saben qué? Ya no tengo ni ganas de seguir comiendo. Me he dado cuenta mientras soplaba
que mi vida solo consiste en comer, haciendo daño a cada desafortunado que se cruce en mi
camino. Es momento de un cambio. Desde hoy, empiezo mi dieta vegana.(El Lobo se ha redimido.
Más o menos, pues en su discurso de autosuperación no pagó a los chanchitos por los daños causados.
Años después, el lobo se hizo Youtuber y tuvo bastante éxito, hasta que el chanchito menor filtró
videos del oscuro pasado del Lobo, y lo cancelaron en Twitter, arruinando su carrera y reputación
para siempre. El Lobo fué juzgado y sentenciado a 86 años de prisión. Fin.)"
		}else return "Primero debe caer la casa más fuerte"
	}
}

object caperucita {
	var objetoQueLLeva = canasta
	var puedeResponder = false
	method peso(){
		return 60
	}
	method llevar(objeto){
		objetoQueLLeva = objeto
	}
	method tirarObjeto(){
		objetoQueLLeva = null
	}
	method podraResponder(){
		puedeResponder = true
	}
	method responderALoboEnBosque(){
		if(puedeResponder){
			puedeResponder = false
			return "Alejate de mi, lobo"
		}
		else{
			return "No hay nadie aqui"
		}
	}
	method insultarALoboEnCasa(){
		loboFeroz.estaraEnojado()
		return "Aflojale a los ñoquis abu"
	}
}

object canasta{
	var manzanasDentro = 6
	method peso(){
		return manzanasDentro*0.2
	}
	method agregarManzanas(cantidad){
		manzanasDentro += cantidad
	}
	method quitarManzanas(cantidad){
		manzanasDentro -= cantidad
	}
}

object abuelita{
	var tieneRopa = true
	method peso(){
		return 50
	}
	method perderRopa(){
		tieneRopa = false
	}
}

object cazador{
	var objetoQueLLeva = hacha
	method llevar(objeto){
		objetoQueLLeva = objeto
	}
	method tieneHacha(){
		return objetoQueLLeva == hacha
	}
	method intimidarAlLobo(){
		if(self.tieneHacha()){
			loboFeroz.sufrirUnaCrisis()
			return "El lobo vió mi hacha y está colapsando, ¡es el momento de atacar!"
		}
		else return "Sin mi hacha no lograré nada"
	}
	method darDeComerAlLobo(){
		if(objetoQueLLeva.sePuedeComer()){
			loboFeroz.comer(objetoQueLLeva)
			return "Tomá esta comida lobito, yo no juzgo"
		}
		else return "No tengo comida"
	}
	method hacharAlLobo(){
		if(not loboFeroz.estaSaludable() and self.tieneHacha()){
			loboFeroz.morir()
			return "¡Maté al lobo!"
		}
		else return "Primero necesito intimidar al lobo o darle de comer"
	}
}

object hacha{
	method peso(){
		return 30
	}
	method sePuedeComer() = false
}

object guisoDeLaAbuela{
	method peso(){
		return 300
	}
	method sePuedeComer() = true
}

//casas

object casaDePaja{
	var cantidadChanchos = 1
	var estaDePie = true
	method resistencia(){
		return 0
	}
	method pesoChanchos(){
		return 5*cantidadChanchos
	}
	method estaDestrozada(){
		return not estaDePie
	}
	method entrarChanchos(cantidad){
		cantidadChanchos += cantidad
	}
	method destruir(){
		estaDePie = false
		if(casaDeMadera.estaDestrozada()){
			casaDeLadrillos.entrarChanchos(cantidadChanchos)
		} else{
			casaDeMadera.entrarChanchos(cantidadChanchos)
		}
		cantidadChanchos = 0
		return""
	}
}

object casaDeMadera{
	var cantidadChanchos = 1
	var estaDePie = true
	method resistencia(){
		return 5
	}
	method pesoChanchos(){
		return 5*cantidadChanchos
	}
	method estaDestrozada(){
		return not estaDePie
	}
	method entrarChanchos(cantidad){
		cantidadChanchos += cantidad
	}
	method destruir(){
		estaDePie = false
		casaDeLadrillos.entrarChanchos(cantidadChanchos)
		cantidadChanchos = 0
		return""
	}
}

object casaDeLadrillos{
	var cantidadChanchos = 1
	var cantidadLadrillos = 300
	var estaDePie = true
	method agregarLadrillos(cantidad){
		cantidadLadrillos += cantidad
	}
	method quitarLadrillos(cantidad){
		cantidadLadrillos -= cantidad
	}
	method resistencia(){
		return cantidadLadrillos*2
	}
	method pesoChanchos(){
		return 5*cantidadChanchos
	}
	method estaDestrozada(){
		return not estaDePie
	}
	method entrarChanchos(cantidad){
		cantidadChanchos += cantidad
	}
	method destruir(){
		estaDePie = false
		cantidadLadrillos = 0
		cantidadChanchos = 0
	}
}