import wollok.game.*
import objetos.*
//Andi voto Ruben
//Sabri voto Pepe
//Nico voto Kniga
//LocoLope
object karoshi {
	const posicionInicial = game.at(3,4)
	var property position = game.center()
	var property ultimaDireccion = posicionInicial
 	var property haciaDonde = down
	method image() = "roberto/character_" + haciaDonde + ".png"
	
	//method position() = game.center()
	//method image() = "roberto/spritenpc1.png"
	
	method revisar(direccion, haciaDondeMira){
		haciaDonde = haciaDondeMira
		if (paredes.listaParedes().any{unaPared=> unaPared.position() == direccion}){
			game.say(self,"no puedo avanzar, hay una pared")
		}
		else{
			self.mover(direccion)
		}
	}
	
	method mover(nuevaDireccion){
		
		self.position(nuevaDireccion)
//		if (ultimaDireccion.x()>nuevaDireccion.x()){
//			haciaDonde = left
//		}
//		else if (ultimaDireccion.x()<nuevaDireccion.x()){
//			haciaDonde = right
//		}
//		else if (ultimaDireccion.y()>nuevaDireccion.y()){
//			haciaDonde = down
//		}
//		else if (ultimaDireccion.y()<nuevaDireccion.y()){
//			haciaDonde = up
//		}
//		ultimaDireccion = nuevaDireccion
		
	}
}

//objetos de prueba
//class Direccion{
//	method sprite()="character_" + karoshi.ultimaDireccion() + ".png"
//}
object right{}
object left{}
object up{}
object down{}