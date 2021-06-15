import wollok.game.*
import config.*
import objetos.*

class Pista{
	const imagen
	method position() = game.origin()
	method image()=imagen
}

object nivel1_pista inherits Pista(imagen="Pistas/nivel1.png"){

}
object nivel2_pista inherits Pista(imagen="Pistas/nivel2.png"){
	
}
object nivel3_pista inherits Pista(imagen="Pistas/nivel3.png"){
	
}
object nivel4_pista inherits Pista(imagen="Pistas/nivel4.png"){
	
}