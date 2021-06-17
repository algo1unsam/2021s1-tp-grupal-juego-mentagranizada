import wollok.game.*
import objetos.*
import niveles.*
import config.*
import extras.*

object pepe {
	var property position = game.origin()
	var posicionInicial
	var property ultimoInput = down
	var property reintentos = 0

	method image() = ultimoInput.toString() + ".png"


//Guarda el ultimo input para el movimiento del sprite y pregunta si puede avanzar en esa direccion
	method guardarDireccion(unaDireccion) {
		ultimoInput = unaDireccion
		self.puedeMoverse(unaDireccion)
	}

//Pregunta si pepe colisiona, si no lo hace, se mueve
	method puedeMoverse(unaDireccion) {
		if (config.colisiona(self, unaDireccion)) {
		}
		else{
			self.mover(unaDireccion)
		}
	}

	method mover(unaDireccion) {
		self.position(unaDireccion.posicionSiguiente(self))
	}

//Reinicia su posicion al presionar R y deja el ultimo input en down para que mire hacia adelante
	method reiniciarPosicion() {
		position = posicionInicial
		ultimoInput = down
	}

//Cambia la posicion de Pepe en cada nivel
	method iniciarEn(x, y) {
		position = game.at(x, y)
		posicionInicial = game.at(x, y)
		ultimoInput = down
	}


	method loQueTieneAdelante() {
		// return config.nivelActual().elementosDelNivel().filter({ unElemento => unElemento.position() == ultimoInput.posicionSiguiente(self) })
		return config.nivelActual().elementosDelNivel().findOrDefault({ unElemento => unElemento.position() == ultimoInput.posicionSiguiente(self) }, vacio)
	}

//Interactua con el objeto que tiene adelante, cada uno produce un efecto diferente:
//Caja: se mueve si no colisiona
//Meta: no hace nada
//Pared: La rata avisa que Pepe no puede empujar paredes
//Vacio: Es el objeto por default, la rata indica que Pepe no tiene nada adelante con que interactuar
	method interactuar() {
		// self.tieneUnElementoAdelante().forEach({unElemento => unElemento.accion(ultimoInput)})
		self.loQueTieneAdelante().accion(ultimoInput)
//Este metodo tenia un forEach aunque siempre reciba una lista con un solo elemento.
//La otra forma que encontramos es usar un find en vez de filter en el metodo tieneUnElementoAdelante(), en este caso
//creamos un objeto vacio con el metodo accion y lo pusimos como default.
//Dejamos comentada la otra solucion para consultar cual es la mejor en este caso!
	}
	
	method sumarReintento() {
		reintentos += 1
	}

	method estaDesesperado() {
		return reintentos > 3
	}

}

