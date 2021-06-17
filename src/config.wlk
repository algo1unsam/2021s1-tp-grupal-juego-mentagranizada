import wollok.game.*
import pepe.*
import objetos.*
import niveles.*
import menuYExtras.*

object config {

	const property volumen = 0.6
	const tiempo = 900
	const property alto = 9
	const property ancho = 11
	var property reintentos = 0
	var property nivelActual = menu

	method configurarTeclas() {
		keyboard.right().onPressDo{ pepe.guardarDireccion(right)}
		keyboard.left().onPressDo{ pepe.guardarDireccion(left)}
		keyboard.up().onPressDo{ pepe.guardarDireccion(up)}
		keyboard.down().onPressDo{ pepe.guardarDireccion(down)}
		keyboard.space().onPressDo{ pepe.interactuar()}
		keyboard.r().onPressDo{ nivelActual.reiniciar()}
		keyboard.enter().onPressDo{ nivelActual.empezarJuego()}
		keyboard.j().onPressDo{ nivelActual.mostrarSolucion()}
		keyboard.l().onPressDo{ nivelActual.eliminarElementos()}
	}

	method revisarColision(unObjeto, nuevaPosicion) {
		return colisionables.lista().any{ unColisionable => unColisionable.position() == nuevaPosicion }
	}

	method nivelActual(unNivel) {
		nivelActual = unNivel
	}

	method sumarReintento() {
		reintentos += 1
	}

	method tiempo() {
		return tiempo
	}

}

object up {

	method posicionSiguiente(unObjeto) {
		return unObjeto.position().up(1)
	}

}

object left {

	method posicionSiguiente(unObjeto) {
		return unObjeto.position().left(1)
	}

}

object down {

	method posicionSiguiente(unObjeto) {
		return unObjeto.position().down(1)
	}

}

object right {

	method posicionSiguiente(unObjeto) {
		return unObjeto.position().right(1)
	}

}

