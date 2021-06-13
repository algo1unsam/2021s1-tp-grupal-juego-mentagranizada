import wollok.game.*
import niveles.*
import config.*

class Extra {
	const position = game.origin()
	
	method image() = "roberto/"+self+".png"
	
	method position() = position
	
	method ejecutar(){
		game.addVisual(self)
		todosLosExtras.agregar(self)
	}
}

object instrucciones inherits Extra(position = game.at(0,5)){

}

object menu inherits Extra {

	method empezarJuego(){
		if (configNivel.siguienteNivel() == self){
			configNivel.siguienteNivel(tutorial)
			configNivel.cambiarDeNivel()
			return null
			}
		return null
	}
}

object final inherits Extra {

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