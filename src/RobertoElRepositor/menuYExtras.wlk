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
		todosLosExtras.agregar(self)
		return null
	}
	
	method empezarJuego(){
		if (configNivel.siguienteNivel() == self){
			configNivel.siguienteNivel(tutorial)
			configNivel.cambiarDeNivel()
			}
	}
}

object todosLosExtras {
	const lista = []
	method agregar(visual){
		lista.add(visual)
	}
	method limpiar(){
		lista.forEach({unExtra => game.removeVisual(unExtra)})
		lista.clear()
	}
}