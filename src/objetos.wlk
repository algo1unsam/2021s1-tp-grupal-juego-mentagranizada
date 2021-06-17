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

	method cajaEnMeta() = config.nivelActual().listaCajas().any{ unaCaja => unaCaja.position() == self.position() }

}

class Caja {

	var property position
	const posicionInicial

	method image() = "caja_bloque.png"

	method accion(unaDireccion) {
		self.puedeMoverse(unaDireccion)
	}

	method puedeMoverse(unaDireccion) {
		if (not config.revisarColision(self, unaDireccion.posicionSiguiente(self))) {
			self.mover(unaDireccion)
		}
	}

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

