import wollok.game.*
import config.*
import extras.*
import pepe.*

class Pared {

	var property position

	method image() = "pared_bloque.png"

	method accion(unaDireccion) {
		game.say(rata, "No podés empujar las paredes")
	}

}

class Meta {

	var property position

	method image() = "meta_bloque.png"

	method accion(unaDireccion) {
	}
	//Retorna true si la posicion de una caja cualquiera coincide con la de la meta
	method cajaEnMeta() = config.nivelActual().listaCajas().any{ unaCaja => unaCaja.position() == self.position() }

}

class Caja {

	var property position
	const posicionInicial

	method image() = "caja_bloque.png"

	//Pregunta si puede moverse
	method accion(unaDireccion) {
		self.puedeMoverse(unaDireccion)
	}

	//Si no colisiona con nada, se mueve
	method puedeMoverse(unaDireccion) {
		if (not config.revisarColision(self, unaDireccion.posicionSiguiente(self))) {
			self.mover(unaDireccion)
		}
	}
	
	//Aparte de mover, ejecuta nivelActual.ganar, que se fija si todas las cajas estan en una meta
	method mover(unaDireccion) {
		self.position(unaDireccion.posicionSiguiente(self))
		sonido.reproducir("caja_mover")
		config.nivelActual().ganar()
	}

	method reiniciarPosicion() {
		position = posicionInicial
	}

}

object colisionables {

	method lista() {
		return [ config.nivelActual().listaParedes(), config.nivelActual().listaCajas() ].flatten()
	}

}

object vacio {

	method accion(unaDireccion) {
		game.say(rata, "No tenés una caja adelante!")
	}

}

