import wollok.game.*
import pepe.*
import objetos.*
import niveles.*
import extras.*

object config {
	//Configuracion de volumen y teclas, además tiene el metodo revisarColision y guarda el nivel actual en el que esta el juego
	const property volumen = 0.6
	const tiempo = 900
	const property alto = 9
	const property ancho = 11
	var property nivelActual = menu

	method configurarTeclas() {
		keyboard.right().onPressDo{ pepe.guardarDireccion(right)}
		keyboard.left().onPressDo{ pepe.guardarDireccion(left)}
		keyboard.up().onPressDo{ pepe.guardarDireccion(up)}
		keyboard.down().onPressDo{ pepe.guardarDireccion(down)}
		keyboard.space().onPressDo{ pepe.interactuar()}
		keyboard.r().onPressDo{ nivelActual.reiniciarNivel()}
		keyboard.enter().onPressDo{ nivelActual.empezarJuego()}
		keyboard.j().onPressDo{ nivelActual.mostrarSolucion()}
	}

//Retorna true si el objeto colisiona con otro en la direccion indicada por parametro
	method colisiona(unObjeto, unaDireccion) {
		return colisionables.lista().any{ unColisionable => unColisionable.position() == unaDireccion.posicionSiguiente(unObjeto) }
	}

	method nivelActual(unNivel) {
		nivelActual = unNivel
	}

	method tiempo() {
		return tiempo
	}

}


//DIRECCIONES, retornan la posicion siguiente para un objeto
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

