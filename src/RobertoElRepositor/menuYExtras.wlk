import wollok.game.*
import niveles.*
import config.*

object instrucciones {
		method image() = "roberto/tutorial.png"
		method position(){
			return game.at(0, 5)	
		}
}

object menu {
	method image()= "roberto/MAIN.png"
	method position() = game.origin()
	
	method ejecutar(){
		game.addVisual(self)
		todosLosExtras.extrasLista().add(self)
		return null
	}
	
	method empezarJuego(){
		if (configNivel.nivelActual() == self){
			configNivel.siguienteNivel(tutorial)
			configNivel.cambiarDeNivel()
			}
	}
}

object todosLosExtras {
	const property extrasLista = []
}