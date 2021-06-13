import wollok.game.*
import config.*

const pared = "Bloques/pared_bloque.png"

const caja = "Bloques/caja_bloque.png"

const meta = "Bloques/meta_bloque.png"

class Elementos {

	var property position

}

class Pared inherits Elementos {

	method image() = pared

}

class Meta inherits Elementos {

	method image() = meta

	method cajaEnSitio() = cajas.lista().any{ unaCaja => unaCaja.position() == self.position() }

}

class Caja inherits Elementos {

	const posicionInicial

	method image() = caja

	method revisar(direccion) {
		if (colisionables.lista().any{ unObjeto => unObjeto.position() == direccion }) {
		} else {
			self.mover(direccion)
		}
	}

	method mover(unaDireccion) {
		position = unaDireccion
		config.ganar()
		return null
	}

	method reiniciarPosicion() {
		position = posicionInicial
	}

}

object paredes inherits ConfigElementos {

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

class ConfigElementos {

	const property lista = []

	method cargar() {
		lista.forEach{ unElemento => game.addVisual(unElemento)}
	}

	method eliminar() {
		lista.forEach{ unElemento => game.removeVisual(unElemento)}
		lista.forEach{ unElemento => lista.remove(unElemento)}
	}

}

object cajas inherits ConfigElementos {

	method crear(x, y) {
		lista.add(new Caja(position = game.at(x, y), posicionInicial = game.at(x, y)))
	}

	method reiniciarPosicion() {
		lista.forEach({ unaCaja => unaCaja.reiniciarPosicion()})
	}

}

object metas inherits ConfigElementos {

	method crear(x, y) {
		lista.add(new Meta(position = game.at(x, y)))
	}

	method cajasEnSuLugar() = lista.all{ unaMeta => unaMeta.cajaEnSitio() }

}

object todosLosElementos {

	method cargar() {
		paredes.cargar()
		cajas.cargar()
		metas.cargar()
	}

	method eliminar() {
		cajas.eliminar()
		paredes.eliminar()
		metas.eliminar()
	}

}

object colisionables {

	var lista = []

	method lista() = lista

	method actualizar() {
		lista = [ paredes.lista(), cajas.lista() ].flatten()
	}

}

