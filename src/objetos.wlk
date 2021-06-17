import wollok.game.*
import config.*
import menuYExtras.*
import pepe.*

const pared = "pared_bloque.png"

const caja = "caja_bloque.png"

const meta = "meta_bloque.png"

class Pared {

	var property position

	method image() = pared

	method accion(unaDireccion) {
		game.say(rata, "No podés empujar las paredes")
	}

}

class Meta {

	var property position

	method image() = meta

	method accion(unaDireccion) {
	}

	method cajaEnMeta() = config.nivelActual().listaCajas().any{ unaCaja => unaCaja.position() == self.position() }

}

class Caja {

	var property position
	const posicionInicial

	method image() = caja

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

	method image() = meta

	method accion(unaDireccion) {
		game.say(rata, "No tenés una caja adelante!")
	}

}

