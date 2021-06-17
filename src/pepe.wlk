import wollok.game.*
import objetos.*
import niveles.*
import config.*
import menuYExtras.*

object pepe {

	var property position = game.origin()
	var posicionInicial
	var property ultimoInput = down

	method image() = "Personaje/" + ultimoInput.toString() + ".png"

	method guardarDireccion(unaDireccion) {
		ultimoInput = unaDireccion
		self.puedeMoverse(unaDireccion)
	}

	method puedeMoverse(unaDireccion) {
		if (not config.revisarColision(self, unaDireccion.posicionSiguiente(self))) {
			self.mover(unaDireccion)
		}
	}

	method mover(unaDireccion) {
		self.position(unaDireccion.posicionSiguiente(self))
	}

	method reiniciarPosicion() {
		position = posicionInicial
		ultimoInput = down
	}

	method iniciarEn(x, y) {
		position = game.at(x, y)
		posicionInicial = game.at(x, y)
		ultimoInput = down
	}

	method tieneUnElementoAdelante() {
		// return config.nivelActual().elementosDelNivel().filter({ unElemento => unElemento.position() == ultimoInput.posicionSiguiente(self) })
		return config.nivelActual().elementosDelNivel().findOrDefault({ unElemento => unElemento.position() == ultimoInput.posicionSiguiente(self) }, vacio)
	}

	method interactuar() {
		// self.tieneUnElementoAdelante().forEach({unElemento => unElemento.accion(ultimoInput)})
		self.tieneUnElementoAdelante().accion(ultimoInput)
//Este metodo tenia un forEach aunque siempre reciba una lista con un solo elemento.
//La otra forma que encontramos es usar un find en vez de filter en el metodo tieneUnElementoAdelante(), en este caso
//creamos un objeto vacio con el metodo accion y lo pusimos como default.
//Dejamos comentada la otra solucion para consultar cual es la mejor en este caso!
	}

	method estaDesesperado() {
		return config.reintentos() > 3
	}

}

