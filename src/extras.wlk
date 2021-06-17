import wollok.game.*
import niveles.*
import config.*
import pepe.*

object instrucciones {

	method image() = "instrucciones.png"

	method position() = game.at(0, 5)

	method mostrar() {
		game.addVisual(self)
	}

	method ocultar() {
		game.removeVisual(self)
	}

}

object rata {

	const position = game.at(0, 0)

	method image() = "Ratita.png"
	
	method position() {
		return position
	}

}

object sonido {

	method sonido(audio) = game.sound(audio + ".mp3")

	method reproducir(audio) {
		self.sonido(audio).play()
	}

	method parar(audio) {
		self.sonido(audio).stop()
	}

}

class Pista {
	const imagen

	method position() = game.origin()

	method image() = imagen

}

object tutorial_pista inherits Pista(imagen = "tutorial_pista.png") {

}

object nivel1_pista inherits Pista(imagen = "nivel1_pista.png") {

}

object nivel2_pista inherits Pista(imagen = "nivel2_pista.png") {

}

object nivel3_pista inherits Pista(imagen = "nivel3_pista.png") {

}

object nivel4_pista inherits Pista(imagen = "nivel4_pista.png") {

}

