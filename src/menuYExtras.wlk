import wollok.game.*
import niveles.*
import config.*
import pepe.*

object instrucciones {
	
	method image() = "Extras/" + self.toString() + ".png"
	
	method position() = game.at(0, 5)
	
	method mostrar() {
		game.addVisual(self)
	}
	
	method ocultar() {
		game.removeVisual(self)		
	}
}

object sonido {
	method sonido(audio) = game.sound("Sonidos/"+audio+".mp3")
	method reproducir(audio){
		self.sonido(audio).play()
	}
	method parar(audio) {
		self.sonido(audio).stop()
	}

}


class Pista{
	method position() = game.origin()
	method image() = "Pistas/" + self.toString() + ".png"
}

object tutorial_pista inherits Pista{

}

object nivel1_pista inherits Pista{

}
object nivel2_pista inherits Pista{
	
}
object nivel3_pista inherits Pista{
	
}
object nivel4_pista inherits Pista{
	
}