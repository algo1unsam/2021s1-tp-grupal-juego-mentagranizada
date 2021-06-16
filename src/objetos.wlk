import wollok.game.*
import config.*
import menuYExtras.*
import pepe.*

const pared = "Bloques/pared_bloque.png"

const caja = "Bloques/caja_bloque.png"

const meta = "Bloques/meta_bloque.png"

class Pared {

	var property position

	method image() = pared

}

class Meta {

	var property position

	method image() = meta

	method cajaEnMeta() = cajas.lista().any{ unaCaja => unaCaja.position() == self.position() }

}

class Caja {

	var property position
	const posicionInicial

	method image() = caja

	method puedeMoverse(unaDireccion) {
		if (not config.revisarColision(self, unaDireccion.posicionSiguiente(self))) {
			self.mover(unaDireccion)
		}
	}

	method mover(unaDireccion) {
		self.position(unaDireccion.posicionSiguiente(self))
		sonido.reproducir("caja_mover")
		pepe.nivelActual().ganar()
	}

	method reiniciarPosicion() {
		position = posicionInicial
	}

}

object paredes {

	const property lista = []

	// Este metodo crea cada objeto PARED con su respectiva posicion para luego
	// poder usar ADDVISUAL y generar las paredes automaticamente con el alto y ancho dado en config.
	method crearBordes(ancho, alto, origenX, origenY) {
		// columnas
		alto.times({ i => lista.add(new Pared(position = game.at(origenX, i + origenY - 1)))})
		alto.times({ i => lista.add(new Pared(position = game.at(ancho + origenX - 1, i + origenY - 1)))})
			// filas
		(ancho - 2).times({ i => lista.add(new Pared(position = game.at(i + origenX, origenY)))})
		(ancho - 2).times({ i => lista.add(new Pared(position = game.at(i + origenX, alto + origenY - 1)))})
	}

	method crear(x, y) {
		lista.add(new Pared(position = game.at(x, y)))
	}

}

object cajas {

	const property lista = []

	method crear(x, y) {
		lista.add(new Caja(position = game.at(x, y), posicionInicial = game.at(x, y)))
	}

	method reiniciarPosicion() {
		lista.forEach({ unaCaja => unaCaja.reiniciarPosicion()})
	}

}

object metas {

	const property lista = []

	method crear(x, y) {
		lista.add(new Meta(position = game.at(x, y)))
	}

	method todasLasCajasEnSuLugar() {
		return lista.all{ unaMeta => unaMeta.cajaEnMeta() }
	}

}

object todosLosElementos {

	method lista() = [ paredes.lista(), cajas.lista(), metas.lista() ].flatten()

	method cargar(elementos) {
		elementos.lista().forEach{ unElemento => game.addVisual(unElemento)}
	}

	method eliminar(elementos) {
		elementos.lista().forEach{ unElemento => game.removeVisual(unElemento)}
		elementos.lista().forEach{ unElemento => elementos.lista().remove(unElemento)}
	}

}

object colisionables {

	method lista() {
		return [ paredes.lista(), cajas.lista() ].flatten()
	}

}

object cartel {

	var property position = game.at(0, -1)

	method image() = "extras/vacio.png"

}

