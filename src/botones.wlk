import wollok.game.*
import placeHolderName.*

class Botones{
	const position
	var image
	const tiempo = 1250
	method image()=image
	method position()=position
}

object botonA inherits Botones(position = game.at(2,1),image = "botonverdeoff.png"){

	method esPresionado() {
		image = "botonverdeon.png"
		game.onTick(tiempo,"PRUEBA", {image = "botonverdeoff.png"} )
		self.notaAcertada()
		}
		
	method notaAcertada(){
		puntaje.sumarPuntos()
	}

}

object botonS inherits Botones(position = game.at(5,1),image = "botonrojooff.png"){

	method esPresionado() {
		image = "botonrojoon.png"
		game.onTick(tiempo,"PRUEBA", {image = "botonrojooff.png"} )
		
	}
}
object botonD inherits Botones(position = game.at(8,1),image = "botonamarillooff.png"){

	method esPresionado() {
		image = "botonamarilloon.png"
		game.onTick(tiempo,"PRUEBA", {image = "botonamarillooff.png"} )
		
	}
}
object botonF inherits Botones(position = game.at(11,1),image = "botonazuloff.png"){

	method esPresionado() {
		image = "botonazulon.png"
		game.onTick(tiempo,"PRUEBA", {image = "botonazuloff.png"} )
		
	}
}


