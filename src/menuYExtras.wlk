import wollok.game.*
import niveles.*
import config.*

class Extra {

	const position = game.origin()

	method image() = "Extras/" + self + ".png"

	method position() = position

	method ejecutar() {
		game.addVisual(self)
		todosLosExtras.agregar(self)
	}

}

object instrucciones inherits Extra(position = game.at(0, 5)) {

}

object menu inherits Extra {
	const musica = sonido.sonido("menu_musica")
	override method ejecutar(){
		game.schedule(1, {=>musica.play()})	
		musica.shouldLoop(true)	
		super()
	}
	method empezarJuego() {
		if (configNivel.siguienteNivel() == self) {
			configNivel.siguienteNivel(tutorial)
			configNivel.cambiarDeNivel()
			musica.stop()
			return null
		}
		return null
	}

}

object final inherits Extra {

}

object todosLosExtras {

	const lista = []

	method agregar(visual) {
		lista.add(visual)
	}

	method limpiar() {
		lista.forEach({ unExtra => game.removeVisual(unExtra)})
		lista.clear()
	}

}

object sonido{
	method sonido(audio) = game.sound("Sonidos/"+audio+".mp3")
	method reproducir(audio){
		self.sonido(audio).play()
	}
	method parar(audio) {
		self.sonido(audio).stop()
	}

}