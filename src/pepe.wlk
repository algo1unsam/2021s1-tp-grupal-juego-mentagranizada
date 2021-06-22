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

	method image() = "pepe_" + ultimoInput.toString() + ".png"

//Guarda el ultimo input para el movimiento del sprite y pregunta si puede avanzar en esa direccion
	method guardarDireccion(unaDireccion) {
		ultimoInput = unaDireccion
		self.puedeMoverse(unaDireccion)
	}

//Pregunta si pepe colisiona, si no lo hace, se mueve
	method puedeMoverse(unaDireccion) {
		if (config.colisiona(self, unaDireccion)) {
		} else {
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

//Devuelve la lista de elementos que tiene en esa posicion (1 elemento o ninguno)
	method loQueTieneAdelante() {
		return config.nivelActual().elementosDelNivel().filter({ unElemento => unElemento.position() == ultimoInput.posicionSiguiente(self) })
	}

//Interactua con el objeto que tiene adelante, cada uno produce un efecto diferente:
//Caja: se mueve si no colisiona
//Meta: no hace nada
//Pared: La rata avisa que Pepe no puede empujar paredes
//Si loQueTieneAdelante() no devuelve uno de esos 3 elementos, no hace nada
	method interactuar() {
		const elemento = self.loQueTieneAdelante()
		if (not elemento.isEmpty()) elemento.first().accion(ultimoInput)// Se usa el primer elemento de la lista (si lo hay)
	} 																	// para no tener que ejecutar un forEach

	method sumarReintento() {
		reintentos += 1
	}

	method estaDesesperado() {
		return reintentos > 3
	}

}

